class User < ApplicationRecord
  enum status: [:coffee, :shopping, :helpful]

  has_secure_password

  has_many :comments

  has_one :social
  has_one :address

  accepts_nested_attributes_for :address

  has_attached_file :image, :style => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => '/images/:style/avatar.png'
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  validates :name, presence: true, length: { minimum: 3 }
  validates_associated :address
  validates :password, confirmation: true, length: { in: 6..20 }, on: create
  validates :email, presence: true, format: { with: /\A.+@.+\z/}, uniqueness: true
end
