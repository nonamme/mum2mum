class User < ApplicationRecord
  enum status: [:coffee, :shopping, :helpful]

  has_many :images
  has_many :comments

  has_one :address

  accepts_nested_attributes_for :images, :address

  validates :name, presence: true, length: { minimum: 3 }
  validates_associated :address
  validates :password, confirmation: true, length: { in: 6..20 }
  validates :email, presence: true, format: { with: /\A.+@.+\z/}, uniqueness: true
end
