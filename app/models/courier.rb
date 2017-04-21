class Courier < ActiveRecord::Base
	has_one :order
end
