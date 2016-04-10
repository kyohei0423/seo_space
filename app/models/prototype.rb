class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :images, dependent: :delete_all
  has_many :comments, dependent: :delete_all
  has_many :likes, dependent: :delete_all

  accepts_nested_attributes_for :images

  acts_as_taggable

  validates :title, :catch_copy, :concept, presence: true

  def did_user_like?(current_user)
    self.likes.find_by(user_id: current_user).present?
  end
end
