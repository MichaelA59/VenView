class CreateVotes < ActiveRecord::Migration[5.0]

  # One review has many votes (one from each user).
  # One user has many votes (one for each review).
  # An individual vote record belongs to one user and one review.

  def change
    create_table :votes do |t|
      t.string :up_or_down, null: false

      t.belongs_to :user
      t.belongs_to :review

      t.timestamps null: false
    end
  end
end
