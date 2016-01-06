class PhotosController < ApplicationController
  layout 'fixed_drawer'

  def index
    @photos = current_user.photos
    @photo = Photo.new

    render layout: 'photos'
  end

  def show
    @photo = Photo.find_by_id(params[:id])
  end

  def edit
    @photo = Photo.find_by_id(params[:id])
  end

  def create
    @photo = Photo.create(photo_params)
  end

  private

  def photo_params
    defaults = {:user_id => current_user.id, :private => true}
    params.require(:photo).permit(:image, :title, :description).merge(defaults)
  end
end
