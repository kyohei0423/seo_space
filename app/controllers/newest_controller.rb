class NewestController < ApplicationController
  def index
    @prototypes = Prototype.order(created_at: :desc).includes(:user, :tags)
    render template: "prototypes/index"
  end
end
