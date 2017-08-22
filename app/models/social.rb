class Social < ApplicationRecord
  belongs_to :user

  validates :facebook, format: { with: /\A[a-zA-Z0-9\.\-\_ ]+\z/ }
  validates :twitter, format: { with: /\A[a-zA-Z0-9\.\-\_ ]+\z/ }
  validates :instagram, format: { with: /\A[a-zA-Z0-9\.\-\_ ]+\z/ }
end
