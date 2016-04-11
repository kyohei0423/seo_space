class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:show, :edit, :update, :destroy]

  def index
    @prototypes = Prototype.includes(:user).order(created_at: :DESC)
  end

  def show
    @comments = @prototype.comments
    @comment = Comment.new

    if user_signed_in?
      @like = @prototype.likes.find_by(user_id: current_user.id)
    end
  end

  def new
    @prototype = Prototype.new
    @prototype.images.build
  end

  def create
    @prototype =  current_user.prototypes.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end

    if user_signed_in?
      @like = @prototype.likes.find_by(user_id: current_user.id)
    end
  end

  def edit
  end

  def update
    if @prototype.update(prototype_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @prototype.destroy
    redirect_to root_path
  end

  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, images_attributes: [:id, :image, :status]).merge(tag_list: params[:prototype][:tag])
  end

  def set_prototype
    @prototype = Prototype.includes(comments: [:user]).find(params[:id])
  end
end
