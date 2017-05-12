class BankBilletPaymentsController < ApplicationController
	before_action :logged_in_user

  before_action :set_bank_billet_payment, only: [:show, :edit, :update, :destroy]

  include BankBilletPaymentsHelper

  # GET /bank_billet_payments
  # GET /bank_billet_payments.json
  def index
    @bank_billet_payments = BankBilletPayment.all
  end

  # GET /bank_billet_payments/1
  # GET /bank_billet_payments/1.json
  def show
    @barcode = BankBilletPayment.find(params[:id])

    @barcode, @num = @barcode.api_access

    @png_path = barcode_to_png(@barcode, params[:id])
  end

  # GET /bank_billet_payments/new
  def new
    @bank_billet_payment = BankBilletPayment.new
  end

  # GET /bank_billet_payments/1/edit
  def edit
  end

  # POST /bank_billet_payments
  # POST /bank_billet_payments.json
  def create
    @bank_billet_payment = BankBilletPayment.new(bank_billet_payment_params)

    respond_to do |format|
      if @bank_billet_payment.save
        format.html { redirect_to @bank_billet_payment, notice: 'Bank billet payment was successfully created.' }
        format.json { render :show, status: :created, location: @bank_billet_payment }
      else
        format.html { render :new }
        format.json { render json: @bank_billet_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bank_billet_payments/1
  # PATCH/PUT /bank_billet_payments/1.json
  def update
    respond_to do |format|
      if @bank_billet_payment.update(bank_billet_payment_params)
        format.html { redirect_to @bank_billet_payment, notice: 'Bank billet payment was successfully updated.' }
        format.json { render :show, status: :ok, location: @bank_billet_payment }
      else
        format.html { render :edit }
        format.json { render json: @bank_billet_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bank_billet_payments/1
  # DELETE /bank_billet_payments/1.json
  def destroy
    @bank_billet_payment.destroy
    respond_to do |format|
      format.html { redirect_to bank_billet_payments_url, notice: 'Bank billet payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bank_billet_payment
      @bank_billet_payment = BankBilletPayment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bank_billet_payment_params
      params.fetch(:bank_billet_payment, {})
    end
end
