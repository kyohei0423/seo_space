class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:show, :edit, :update]
  def index
    @prototypes = Prototype.order("created_at DESC")
  end

  def show
    @sub_images = @prototype.images.sub
  end

  def new
    @prototype = Prototype.new
    @images = @prototype.images.build
  end

  def create
    @prototype =  current_user.prototypes.new(prototype_params)
    if @prototype.save
      redirect_to root_url
    else
      render :new
    end
  end

  def edit
    @images = @prototype.images
  end

  def update
    if @prototype.update(prototype_params)
      redirect_to root_url
    else
      render :edit
    end
  end

  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, images_attributes: [:id, :image, :status]).merge(tag_list: params.require(:prototype).require(:tags).values)
  end

  def set_prototype
    @prototype = Prototype.includes(:images).find(params[:id])
  end
end
