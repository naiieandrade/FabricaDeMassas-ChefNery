class Order < ActiveRecord::Base
	belongs_to :user
	belongs_to :courier
	has_many :order_items
  	belongs_to :order_status
	has_and_belongs_to_many :products
	has_one :payment
	#validates :shippment_address, presence: true

	def subtotal
		order_items.collect { |order_item| order_item.valid? ? (order_item.quantity * order_item.unit_price) : 0}.sum
	end

	def update_subtotal
		self[:subtotal] = subtotal
	end

end
