class Vote < ApplicationRecord
  validates :up_or_down, inclusion: { in: ["upvote", "downvote"] }

  belongs_to :user
  belongs_to :review
end
