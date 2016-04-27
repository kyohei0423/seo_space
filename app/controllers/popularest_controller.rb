class PopularestController < ApplicationController
  def index
    @prototypes = Prototype.order(likes_count: :desc).includes(:user, :tags).page(params[:page]).per(10)
    render template: "prototypes/index"
  end
end
