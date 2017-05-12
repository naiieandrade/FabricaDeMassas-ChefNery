class Spice < Ingredient
	public_class_method :new
	def set_type(params)
		self.type_ingredient = params
	end
end
