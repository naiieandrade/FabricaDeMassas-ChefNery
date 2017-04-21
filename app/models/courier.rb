class Courier < ActiveRecord::Base
	has_many :order
	enum status: {livre: 0, entregando: 1}
end
