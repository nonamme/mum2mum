class Place < ApplicationRecord
  has_attached_file :image, :default_url => '/images/:style/empty.png'
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  has_many :events

  validates :name, presence: true, format: { with: /\A[a-zA-Z ]+\z/ }
  validates :city, presence: true, format: { with: /\A[a-zA-Z ]+\z/ }
  validates :local_no, presence: true, format: { with: /\A[0-9]+\z/ }
  validates :street, presence: true, format: { with: /\A[a-zA-Z]+\z/ }
  validates :post_code, presence: true, format: { with: /\A[a-zA-Z0-9 ]+\z/ }
  validates :link, presence: true, format: { with: /\A[a-zA-Z0-9\.\-\_\?\=]+\z/ }
  validates :open_hours, presence: true, format: { with: /\A[a-zA-Z0-9 \-]+\z/ }
  validates :description, presence: true, format: { with: /\A[a-zA-Z ]+\z/ }
end
