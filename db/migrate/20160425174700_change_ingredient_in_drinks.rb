class ChangeIngredientInDrinks < ActiveRecord::Migration
  def change
    change_column :drinks, :ingredient, :string, :default => ""
  end
end
