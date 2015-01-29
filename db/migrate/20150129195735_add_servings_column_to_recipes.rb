class AddServingsColumnToRecipes < ActiveRecord::Migration
  def change
    add_column(:recipes, :servings, :integer) do
    end
  end
end
