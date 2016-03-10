class Prototype < ActiveRecord::Base
  has_many :images
  accepts_nested_attributes_for :address
end
