class CommentsController < ApplicationController
  def create
    comment = Comment.create(comments_params)
    @prototype = comment.prototype
    @comment = Comment.new
  end

  private
  def comments_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end
