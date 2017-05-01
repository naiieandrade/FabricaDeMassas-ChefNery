class InvoicesController < ApplicationController
	require 'invoicing/ledger_item/pdf_generator'

	include InvoicesHelper

	def index
	end

	def new
		@invoice = InvoicingLedgerItem.new
	end

	def create
		@invoice = InvoicingLedgerItem.new(sender_id: 1, recipient_id: current_user.id, currency: 'brl')
		create_line_item(@invoice, current_order)
		if @invoice.save
			destroy_session_order
		end


	end

	def show
		ledger_item = InvoicingLedgerItem.where(recipient_id: current_user.id).take
		@line_items = InvoicingLineItem.where(ledger_item_id: ledger_item.id)
		pdf_creator = Invoicing::LedgerItem::PdfGenerator.new(ledger_item)
		user = User.find(current_user.id)
		pdf_file = pdf_creator.render "#{user.name} Bill: #{ledger_item.id}.pdf"
	end

	


end
