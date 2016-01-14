class PhotosController < ApplicationController

  def index
    @photos = current_user.photos.paginate(:page => params[:page], per_page: 15).order('created_at DESC')
    @photo = Photo.new
    @albums = current_user.albums

    if @photos.count == 0
      redirect_to new_photo_path
    else
      respond_to do |format|
        format.html
        format.js {render :layout => false}
      end
    end
  end

  def show
    @photo = Photo.find_by_id(params[:id])
    check_photo(@photo)
  end

  def edit
    @albums = current_user.albums
    @photo = Photo.find_by_id(params[:id])
    if @photo.user == current_user
      check_photo(@photo)
    else
      render 'photos/error'
    end
  end

  def update
    @photo = Photo.find_by_id(params[:id])

    if @photo.user == current_user
      check_photo(@photo)
      if @photo.update(photo_params_update)
        redirect_to photo_path(@photo)
      end
    else
      render 'photos/error'
    end
  end

  def new
    @photo = Photo.new
    @albums = current_user.albums
  end

  def create
    @photo = Photo.create(photo_params)

    respond_to do |format|
      format.html
      format.js {render :layout => false}
    end
  end

  def destroy
    @photo = Photo.find_by_id(params[:id])
    if @photo.user == current_user
      @photo.image.destroy
      @photo.delete
    else
      render 'photos/error'
    end

    respond_to do |format|
      format.html {redirect_to photos_path}
      format.js {render :layout => false}
    end
  end

  def destroy_all
    @photos = current_user.photos
    @albums = current_user.albums
    Thread.new do
      @photos.destroy_all
      @photos.delete_all
      @albums.destroy_all
    end
    redirect_to dashboard_path, notice: t('pictures.after_delete_message')
  end

  private

  def photo_params
    defaults = {:user_id => current_user.id, :description => t('pictures.no_description')}
    params.require(:photo).permit(:image, :title, :description, :private, :album_id).merge(defaults)
  end

  def photo_params_update
    params.require(:photo).permit(:title, :description, :private, :album_id)
  end

  def check_photo(photo)
    if photo.nil?
      not_found
    end

    if photo.user != current_user
      render 'photos/error' if photo.private?
    end
  end
end
