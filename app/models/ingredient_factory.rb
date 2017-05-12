class IngredientFactory < ActiveRecord::Base

	has_many :ingredients

	def create_ingredient(ingredient_type)

		case ingredient_type
	
		when 'pasta' then @ingredient = Pastum.new
		when 'filling' then @ingredient = Filling.new
		when 'sauce' then @ingredient = Sauce.new
		when 'spice' then @ingredient = Spice.new
			
		end

		@ingredient
	end
end
