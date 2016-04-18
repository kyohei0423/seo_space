class TagsController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.most_used.where('taggings_count > 0')
  end

  end
end
