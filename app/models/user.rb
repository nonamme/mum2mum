class User < ApplicationRecord
  has_many :images
  has_one :address

  accepts_nested_attributes_for :images, :address
end
