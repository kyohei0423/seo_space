class PopularestController < ApplicationController
  def index
    @prototypes = Prototype.order(likes_count: :desc).includes(:user, :tags)
    render template: "prototypes/index"
  end
end
