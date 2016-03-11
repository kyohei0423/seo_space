class PrototypesController < ApplicationController
  def index
  end

  def new
    @prototype = Prototype.new
    @prototype.images.build
  end

  def create
    @prototype = Prototype.create(prototype_params)
  end

  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, images_attributes: [:id, :image])
  end
end
