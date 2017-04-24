class AddVenueNameToReviews < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :venue_name, :string
  end
end
