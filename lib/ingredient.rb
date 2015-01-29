class Ingredient < ActiveRecord::Base
  has_and_belongs_to_many(:recipes)
  validates_uniqueness_of(:name, {:case_sensitive => false})

end
