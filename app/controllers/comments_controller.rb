class CommentsController < ApplicationController
  def create
    prototype = Prototype.find(params[:prototype_id])
    comment = prototype.comments.new(comments_params)
    if comment.save
      redirect_to prototype_path(prototype)
    else
      render template: "prototypes/show"
    end
  end

  private
  def comments_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id)
  end
end
