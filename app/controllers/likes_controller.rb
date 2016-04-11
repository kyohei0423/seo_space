class LikesController < ApplicationController
  before_action :set_proto_type, only: [:create, :destroy]

  def create
    @like = Like.create(user_id: current_user.id, prototype_id: params[:prototype_id])
  end

  def destroy
    Like.find_by(user_id: current_user.id, prototype_id: params[:prototype_id]).destroy
  end

  private
  def set_proto_type
    @prototype = Prototype.find(params[:prototype_id])
  end
end
