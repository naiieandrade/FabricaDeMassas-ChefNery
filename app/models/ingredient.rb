#GRASP pattern: Low coupling does not have any dependency with other classes

class Ingredient < ActiveRecord::Base
  has_and_belongs_to_many :products
  belongs_to :ingredient_factories
  private_class_method :new
  
    def self.search(search)
  		if search
    		where(["TYPE_INGREDIENT LIKE ?", "%#{search}%"])
    	end
	end

end
