module InvoicesHelper

	def create_line_item(invoice, current_order)
		current_order.order_items.each do |item|
			product = Product.find(item.product_id)
			invoice.line_items.build(description: product.title, net_amount: product.price, tax_amount: 0)	
		end
	end
end
