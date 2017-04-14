class Order < ActiveRecord::Base
	belongs_to :user
	has_many :order_items

	validates :shippment_address, presence: true

	def subtotal
		orders_items.collect { |order_item| order_item.valid? ? (order_item.quantity * order_item.unit_price} : 0}.sum
	end

	def
		self[:subtotal] = subtotal
	end

end
