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

  def show
    @album = Album.find_by_id(params[:id])
    check_album(@album)
    @photos = @album.photos.paginate(:page => params[:page], per_page: 15).order('created_at DESC') unless @album.photos.count == 0
    @upload = Photo.new

    respond_to do |format|
      format.html
      format.js {render :layout => false}
      format.json {render :layout => false}
    end
  end

  def destroy_all
    @albums = current_user.albums
    Thread.new do
      @albums.photos.destroy
      @albums.destroy
    end

    render dashboard_path
  end

  def destroy
    @album = Album.find_by_id(params[:id])
    Thread.new do
      @album.photos.destroy_all
      @album.destroy
    end
    redirect_to dashboard_path
  end

  private

  def album_params
    defaults = {:user_id => current_user.id}
    params.require(:album).permit(:title, :private).merge(defaults)
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
