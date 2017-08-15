class Place < ApplicationRecord
  has_attached_file :image, :default_url => '/images/:style/empty.png'
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  has_many :events
end
