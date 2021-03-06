class User < ApplicationRecord
  has_attached_file :image, :style => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => '/images/:style/avatar.png'
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  enum status: ["Mamusia na kawę", "Mamusia na shopping", "Mamusia do pomocy", "Mamusia na spacer", "Mamusia na pogaduchy"]

  has_secure_password

  has_many :comments

  has_one :social
  has_one :address

  accepts_nested_attributes_for :address

  def address
    super || build_address
  end
  # validates :name, presence: true, length: { minimum: 3 }
#  validates_associated :address
  # validates :password, confirmation: true, length: { in: 6..20 }, on: create
  # validates :email, presence: true, format: { with: /\A.+@.+\z/}, uniqueness: true
end
