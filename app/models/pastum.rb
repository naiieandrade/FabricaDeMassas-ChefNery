class Pastum < Ingredient
	public_class_method :new
	def set_type(param_value)
		self.type_ingredient = param_value
	end

end
