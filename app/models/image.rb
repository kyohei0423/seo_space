class Image < ActiveRecord::Base
  belongs_to :prototype
  mount_uploader :image, AvatarUploader
end
