class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :city, presence: true, length: { minimum: 3 }
end
