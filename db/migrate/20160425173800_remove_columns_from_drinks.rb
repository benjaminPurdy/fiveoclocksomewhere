class RemoveColumnsFromDrinks < ActiveRecord::Migration
  def change
    remove_column :drinks, :created_at, :timestamp
    remove_column :drinks, :updated_at, :timestamp
    remove_column :drinks, :image_url, :string
  end
end
