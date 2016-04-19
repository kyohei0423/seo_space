class TagsController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.most_used.where('taggings_count != 0')
  end

  def show
    tag = ActsAsTaggableOn::Tag.find(params[:id])
    @prototypes = Prototype.tagged_with(tag).includes(:user).includes(:tags)
  end
end
