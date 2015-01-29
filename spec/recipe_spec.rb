require("spec_helper")

describe(Recipe) do

  it { should have_and_belong_to_many(:ingredients) }
  it { should have_and_belong_to_many(:categories) }

  it('should only accept unique recipe names') do
    recipe1 = Recipe.new({:name => "jambalaya"})
    recipe1.save()
    recipe2 = Recipe.new({:name => "jambalaya"})
    expect(recipe2.save()).to(eq(false))
  end

  it('capitalizes the recipe name') do
    recipe = Recipe.create({:name => "a jambalaya stew"})
    expect(recipe.name()).to(eq("A Jambalaya Stew"))
  end

  it("the scope works") do
    recipe1 = Recipe.create({:name => "a jambalaya stew", :servings => 4})
    recipe2 = Recipe.create({:name => "gumbo", :servings => 8})
    recipe3 = Recipe.create({:name => "etouffe", :servings => 10})
    expect(Recipe.all().servings?(6)).to(eq([recipe2, recipe3]))
  end
end
