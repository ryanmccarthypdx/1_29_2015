require('bundler/setup')
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @list_of_categories = Category.all()
  @title = "Cookbook"
  erb(:index)
end

post('/recipe_add') do
  name_input = params.fetch("new_recipe_name")
  new_recipe = Recipe.create({:name => name_input})
  @recipe_name = new_recipe.name()
  @recipe_id = new_recipe.id()
  @title = @recipe_name
  @list_of_ingredients = Ingredient.all()
  @list_of_categories = Category.all()
  erb(:recipe_edit)
end

post('/ingredient_add') do
  @list_of_ingredients = Ingredient.all()
  @recipe_id = (params.fetch("recipe_id")).to_i()
  @recipe_ingredients = Recipe.find(@recipe_id).ingredients()
  @recipe_name = (params.fetch("recipe_name"))
  new_ingredient_name = params.fetch('new_ingredient_name')
  if new_ingredient_name != ""
    Ingredient.create({:name => new_ingredient_name, :recipe_ids => @recipe_id})
  else
    old_ingredient_id = params.fetch('ingredient_id')
    old_ingredient = Ingredient.find(old_ingredient_id)
    old_ingredient.update({:recipe_ids => [@recipe_id]})
  end
  @title = @recipe_name

  @list_of_categories = Category.all()
  erb(:recipe_edit)
end
