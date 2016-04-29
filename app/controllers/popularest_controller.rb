class PopularestController < ApplicationController
  def index
    @prototypes = Prototype.includes(:user).order(created_at: :DESC).includes(:tags).page(params[:page])
    render template: "prototypes/index"
  end
end
