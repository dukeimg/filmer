class AlbumsController < ApplicationController
  layout('photos')

  def new
    @album = Album.new
  end

  def create
    if @album = Album.create(album_params)
      redirect_to album_path(@album)
    end
  end

  def destroy_all
    @albums = current_user.albums
    @albums.photos.destroy
    @albums.destroy

    render photos_path
  end

  private

  def album_params
    params.require(:album).permit(:title, :private)
  end

  def check_album(album)
    if album.nil?
      not_found
    end

    if album.user != current_user
      render 'albums/error' if album.private?
    end
  end
end
