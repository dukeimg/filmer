class UsersController < ApplicationController
  layout 'fixed_drawer'

  def show
    @user = User.find_by_id(params[:id])
    if @user.nil?
      not_found
    end
    @albums = @user.albums
    @current = current_user
    if @user == @current
      @photos = @user.photos.paginate(:page => params[:page], per_page: 15).order('created_at DESC')
    else
      @photos = @user.photos.where(:private => false).paginate(:page => params[:page], per_page: 15).order('created_at DESC')
    end
  end

  def update
    @user = User.find_by_id(params[:id])
    if @user.update(user_params)
      if @user.cropping?
        @user.avatar.reprocess!
      end
      respond_to do |format|
        format.json {render 'users/update', :formats => [:js]}
        format.html {redirect_to user_path}
      end
    end
  end

  def destroy
    @user = User.find_by_id(params[:id])
    @user.albums.destroy_all
    @user.photos.destroy_all
    if @user.destroy
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:avatar, :crop_x, :crop_y, :crop_w, :crop_h)
  end
end