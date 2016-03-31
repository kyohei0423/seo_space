class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :images, dependent: :delete_all
  accepts_nested_attributes_for :images
  acts_as_taggable

  validates :title, :catch_copy, :concept, presence: true
end
