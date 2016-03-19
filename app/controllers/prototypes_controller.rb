class PrototypesController < ApplicationController
  def index
  end

  def new
    @prototype = Prototype.new
    @prototype.images.build
  end

  def create
    redirect_to root_url if current_user.prototypes.create(prototype_params)
  end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, images_attributes: [:id, :image, :status]).merge(tag_list: params.require(:prototype).require(:tags).values)
  end
end
