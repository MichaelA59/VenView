class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :title, null: false
      t.integer :cost
      t. integer :sound_quality
      t.integer :parking
      t.text :body

      t.belongs_to :venue, null: false
      t.belongs_to :user, null: false
      t.timestamps
    end
  end
end
