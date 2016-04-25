class AddIngredientToDrinks < ActiveRecord::Migration
  def change
    add_column :drinks, :ingredient, :string
  end
end
