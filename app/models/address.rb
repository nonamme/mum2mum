class Address < ApplicationRecord
  belongs_to :user, optional: true

  validates :city, presence: true, length: { minimum: 3 }
  validates :home_number, numericality: {only_integer: true}, allow_blank: true
  validates :street, format: { with: /\A[a-zA-Z]+\z/ }, allow_blank: true
  validates :post_code, format: { with: /\A[a-zA-Z0-9 \-]+\z/}, allow_blank: true

  def address
    [home_number, street, city, country].compact.join(', ')
  end
end
