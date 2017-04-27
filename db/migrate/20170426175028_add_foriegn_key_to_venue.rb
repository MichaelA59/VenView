class AddForiegnKeyToVenue < ActiveRecord::Migration[5.0]
  def change
    add_column :venues, :user_id, :integer
  end
end
