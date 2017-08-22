class Event < ApplicationRecord
  belongs_to :place

  validates :title, presence: true, format: { with: /\A[a-zA-Z0-9 ]+\z/ }
  validates :description, presence: true, format: { with: /\A[a-zA-Z0-9 ]+\z/ }
end
