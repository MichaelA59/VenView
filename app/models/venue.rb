require 'uri'

class Venue < ApplicationRecord
  validates :name, presence: true

  validates :url, format: { with: URI.regexp }, if: 'url.present?'

  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true

  validates :zip, presence: true
  validates :zip, format: {
    with: /[\d]/,
    message: "is not a number"
  }
  validates :zip, length: { is: 5 }

  has_many :reviews
end
