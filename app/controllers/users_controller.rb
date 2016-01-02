class UsersController < ApplicationController
  def show
    @user = User.find_by_id(params[:id])
    @current = current_user
  end

  def update
    @user = current_user
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

  private

  def user_params
    params.require(:user).permit(:avatar, :crop_x, :crop_y, :crop_w, :crop_h)
  end
end