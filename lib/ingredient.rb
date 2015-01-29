class Ingredient < ActiveRecord::Base
  has_and_belongs_to_many(:recipes)
  validates_uniqueness_of(:name, {:case_sensitive => false})
  before_save(:titlecase_name)

  scope :servings?, lambda {|serving_request|
    where("SERVINGS >= ?", serving_request)}

private
  define_method(:titlecase_name) do
    self.name=(name().titlecase())
  end
end
