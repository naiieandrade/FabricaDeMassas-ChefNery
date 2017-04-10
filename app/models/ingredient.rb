#GRASP pattern: Low coupling does not have any dependency with other classes

class Ingredient < ActiveRecord::Base
  has_and_belongs_to_many :products
end
