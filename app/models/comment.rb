class Comment < ActiveRecord::Base
  belongs_to :prototype

  validates :text, presence: true
end
