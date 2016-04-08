class CommentsController < ApplicationController
  def create
    prototype = Prototype.find(params[:prototype_id])
    comment = prototype.comments.new(comments_params)
    @comments = prototype.comments
  end

  private
  def comments_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id)
  end
end
