class User < ActiveRecord::Base
  # Association
  has_many :prototypes
  has_many :comments
  has_many :likes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :avatar, AvatarUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   def update_without_current_password(params, *options)
     params.delete(:current_password)
     if params[:password].blank? && params[:password_confirmation].blank?
       params.delete(:password)
       params.delete(:password_confirmation)
     end
     result = update_attributes(params, *options)
     clean_up_passwords
     result
   end
end
