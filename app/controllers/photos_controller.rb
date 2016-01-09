class PhotosController < ApplicationController

  def index
    @photos = current_user.photos
    @photo = Photo.new

    if @photos.count == 0
      redirect_to new_photo_path
    else
      render layout: 'photos'
    end
  end

  def show
    @photo = Photo.find_by_id(params[:id])

    if @photo.user_id != current_user.id
      render 'photos/error'
    end
  end

  def edit
    @photo = Photo.find_by_id(params[:id])

    if @photo.user_id != current_user.id
      render 'photos/error'
    end
  end

  def update
    @photo = Photo.find_by_id(params[:id])

    if @photo.user_id != current_user.id
      render 'photos/error'
    end

    if @photo.update(photo_params_update)
      redirect_to photo_path(@photo)
    end
  end

  def new
    @photo = Photo.new
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
    @photo.image.destroy
    @photo.delete

    respond_to do |format|
      format.html {redirect_to photos_path}
      format.js {render :layout => false}
    end
  end

  private

  def photo_params
    defaults = {:user_id => current_user.id, :description => t('pictures.no_description')}
    params.require(:photo).permit(:image, :title, :description, :private).merge(defaults)
  end

  def photo_params_update
    params.require(:photo).permit(:title, :description, :private)
  end
end
