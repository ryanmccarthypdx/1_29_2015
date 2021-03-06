class Category < ActiveRecord::Base
  has_and_belongs_to_many(:recipes)
  validates_uniqueness_of(:name, {:case_sensitive => false})
  before_save(:titlecase_name)

private
  define_method(:titlecase_name) do
    self.name=(name().titlecase())
  end
end
