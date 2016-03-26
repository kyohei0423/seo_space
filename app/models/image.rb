class Image < ActiveRecord::Base
  # enum
  enum status: [:main, :sub]
  # Association
  belongs_to :prototype

  mount_uploader :image, AvatarUploader

  validates :image, presence: true
end
