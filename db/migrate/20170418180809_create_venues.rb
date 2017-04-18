class CreateVenues < ActiveRecord::Migration[5.0]
  def change
    create_table :venues do |t|
      t.string :name, null:false
      t.string :url
      t.string :address, null:false
      t.string :city, null:false
      t.string :state, null:false
      t.string :zip, null:false

      t.timestamps null:false
    end
  end
end
