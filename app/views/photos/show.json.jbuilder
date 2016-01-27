json.array! @comments.reverse.drop(1).reverse do |comment|

  json.(comment, :created_at, :updated_at)

  @user = comment.user
  @name = @user.name << ' ' << @user.surname

  json.author @name
  json.body comment.body
  json.upvotes comment.upvotes
  json.linkToUser user_path(@user)
  json.userAvatar @user.avatar.url(:thumb)


end