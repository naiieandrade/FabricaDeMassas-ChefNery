module InvoicesHelper

	def create_line_item(invoice, current_order)
		current_order.order_items.each do |item|
			product = Product.find(item.product_id)
			invoice.line_items.build(description: product.title, net_amount: product.price * item.quantity, tax_amount: 0)	
		end

		if !current_order.shippment_address.nil?
			invoice.line_items.build(description: "Frete", net_amount: current_order.delivery_price, tax_amount: 0)	
		end
	end

	def create_invoice_pdf(ledger_item, current_user)
		pdf_creator = Invoicing::LedgerItem::PdfGenerator.new(ledger_item)
		user = User.find(current_user.id)
		pdf_file = pdf_creator.render "#{user.name} Bill: #{ledger_item.id}.pdf"
	end

	def display_invoice_pdf(ledger_item, current_user)
		if(!current_user.nil?)
			send_file("#{current_user.name} Bill: #{ledger_item.id}.pdf", :filename => "#{current_user.name} Bill: #{ledger_item.id}.pdf", :disposition => 'inline', :type => "application/pdf")	
		end
	end
end
