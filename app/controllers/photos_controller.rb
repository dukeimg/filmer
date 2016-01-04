class PhotosController < ApplicationController
  layout 'photos'

  def index
    @photos = current_user.photos
  end

  def new

  end
end
