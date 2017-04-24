class Order < ActiveRecord::Base
	belongs_to :user
	has_many :order_items
  	belongs_to :order_status
	#validates :shippment_address, presence: true

	def subtotal
		order_items.collect { |order_item| order_item.valid? ? (order_item.quantity * order_item.unit_price) : 0}.sum
	end

	def update_subtotal
		self[:subtotal] = subtotal
	end

end
