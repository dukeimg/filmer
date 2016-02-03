class CommentsController < ApplicationController

  def create
    @parent = parent
    @comment = @parent.comments.new(comment_params)
    if @comment.save(comment_params)
      respond_to do |format|
        format.js {render :nothing => true}
      end
    end
  end

  private

  def parent
    Album.find(params[:album_id]) if params[:album_id]
    Photo.find(params[:photo_id]) if params[:photo_id]
  end

  def comment_params
    defaults = {:user_id => current_user.id, :upvotes => 0}
    params.require(:comment).permit(:body).merge(defaults)
  end
end
