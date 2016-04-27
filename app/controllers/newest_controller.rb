class NewestController < ApplicationController
  def index
    @prototypes = Prototype.order(created_at: :desc).includes(:user, :tags).page(params[:page]).per(10)
    render template: "prototypes/index"
  end
end
