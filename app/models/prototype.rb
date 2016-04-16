class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :images, dependent: :delete_all
  has_many :comments, dependent: :delete_all
  has_many :likes, dependent: :delete_all

  accepts_nested_attributes_for :images

  acts_as_taggable

  validates :title, :catch_copy, :concept, presence: true

  def user_like(user)
    likes.find_by(user_id: user.id)
  end
end
