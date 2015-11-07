class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name
      t.string :zone
      t.string :picture_url
      t.integer :minutes_offset


      t.timestamps null: false
    end
  end
end
