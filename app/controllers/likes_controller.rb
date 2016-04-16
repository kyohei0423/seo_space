class LikesController < ApplicationController
  before_action :set_prototype, only: :create

  def create
    @like = @prototype.likes.create(user_id: current_user.id)
  end

  def destroy
    Like.find_by(prototype_id: params[:prototype_id], user_id: current_user.id).destroy
    set_prototype
  end

  private
  def set_prototype
    @prototype = Prototype.find(params[:prototype_id])
  end
end
