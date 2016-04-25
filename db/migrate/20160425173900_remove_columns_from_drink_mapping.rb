class RemoveColumnsFromDrinkMapping < ActiveRecord::Migration
  def change
    remove_column :drink_country_mappings, :created_at, :timestamp
    remove_column :drink_country_mappings, :updated_at, :timestamp
  end
end
