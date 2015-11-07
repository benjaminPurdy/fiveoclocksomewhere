class CreateDrinkCountryMappings < ActiveRecord::Migration
  def change
    create_table :drink_country_mappings do |t|
      t.integer :country_id
      t.integer :drink_id

      t.timestamps null: false
    end

    add_index :drink_country_mappings, [:drink_id, :country_id], :unique => true
    add_index :drink_country_mappings, [:country_id, :drink_id], :unique => true
  end
end
