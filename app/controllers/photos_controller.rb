class PhotosController < ApplicationController
  layout 'photos'

  def index
    @photos = current_user.photos
    @photo = Photo.new
  end

  def create
    @photo = Photo.create(photo_params)
    if @photo.save
      redirect_to photos_path
    end
  end

  private

  def photo_params
    defaults = {:user_id => current_user.id, :private => true}
    params.require(:photo).permit(:image, :title, :description).merge(defaults)
  end
end
