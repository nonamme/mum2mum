class Address < ApplicationRecord
  belongs_to :user, optional: true

  validates :city, presence: true, length: { minimum: 3 }
  validates :home_number, numericality: true, {only_integer: true}
  validates :street, format: { with: /\A[a-zA-Z]+\z/ }
  validates :post_code, format: { with: /\A[a-zA-Z0-9 \-]\z/}

  def address
    [home_number, street, city, country].compact.join(', ')
  end
end
