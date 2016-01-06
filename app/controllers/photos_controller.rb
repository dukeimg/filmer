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
  end

  def edit
    @photo = Photo.find_by_id(params[:id])
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

  private

  def photo_params
    defaults = {:user_id => current_user.id, :private => true, :description => t('pictures.no_description')}
    params.require(:photo).permit(:image, :title, :description).merge(defaults)
  end
end
