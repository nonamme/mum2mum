class Address < ApplicationRecord
  geocoded_by :address
  after_validation :geocode

  belongs_to :user, optional: true
  validates :city, presence: true, length: { minimum: 3 }

  def address
    [home_number, street, city, country].compact.join(', ')
  end
end
