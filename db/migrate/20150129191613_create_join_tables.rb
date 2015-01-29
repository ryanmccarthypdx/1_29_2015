class CreateJoinTables < ActiveRecord::Migration
  def change
    create_table(:categories_recipes) do |t|
      t.integer :category_id
      t.integer :recipe_id
    end
    create_table(:ingredients_recipes) do |t|
      t.integer :recipe_id
      t.integer :ingredient_id
    end
  end
end
