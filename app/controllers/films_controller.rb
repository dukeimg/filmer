class FilmsController < ApplicationController
  def new
    @film = Film.new
    @photos = current_user.photos.all
    @albums = current_user.albums.all
  end
end
