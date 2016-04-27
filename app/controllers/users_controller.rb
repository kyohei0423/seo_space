class UsersController < ApplicationController
  before_action :set_user

  def show
    @prototypes = @user.prototypes.includes(:tags).page(params[:page]).per(10)
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end
