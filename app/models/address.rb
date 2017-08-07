class Address < ApplicationRecord
  belongs_to :user, optional: true

  validates :city, presence: true, length: { minimum: 3 }

  def address
    [home_number, street, city, country].compact.join(', ')
  end
end
