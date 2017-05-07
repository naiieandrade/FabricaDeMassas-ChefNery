class InvoicesController < ApplicationController
	require 'invoicing/ledger_item/pdf_generator'

	include InvoicesHelper

	def index
		@invoices = InvoicingLedgerItem.where(recipient_id: current_user.id)
	end

	def new
		@invoice = InvoicingLedgerItem.new
	end

	def create
		@invoice = InvoicingLedgerItem.new(sender_id: 1, recipient_id: current_user.id, currency: 'brl')
		create_line_item(@invoice, current_order)
		if @invoice.save
			destroy_session_order
			@ledger_item = InvoicingLedgerItem.where(recipient_id: current_user.id).last
			create_invoice_pdf(@ledger_item, current_user)
			redirect_to '/invoices'
		end


	end

	def show
		@invoice = InvoicingLedgerItem.find(params[:id])
		display_invoice_pdf(@invoice, current_user)		
	end


end
