class Review < ApplicationRecord
  validates :title, presence: true

  belongs_to :user
  belongs_to :venue
  has_many :votes
end
