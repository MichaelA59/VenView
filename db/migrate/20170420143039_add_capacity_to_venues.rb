class AddCapacityToVenues < ActiveRecord::Migration[5.0]
  def change
    add_column :venues, :capacity, :string
  end
end
