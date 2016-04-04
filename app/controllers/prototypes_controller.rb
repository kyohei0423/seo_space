class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:show, :edit, :update]
  
  def index
    @prototypes = Prototype.includes(:user).order(created_at: :DESC)
  end

  def show
  end

  def new
    @prototype = Prototype.new
    @prototype.images.build
  end

  def create
    @prototype =  current_user.prototypes.new(prototype_params)
    if @prototype.save
      redirect_to root_url
    else
      render :new
    end
  end

  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, images_attributes: [:id, :image, :status]).merge(tag_list: params[:prototype][:tag])
  end

  def set_prototype
    @prototype = Prototype.includes(:user).find(params[:id])
  end
end
