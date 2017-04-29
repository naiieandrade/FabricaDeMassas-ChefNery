class Review < ActiveRecord::Base
	belongs_to :user
	belongs_to :product

	validates_presence_of :rating, :message => "Deve haver alguma nota"

end
