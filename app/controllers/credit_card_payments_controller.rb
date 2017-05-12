class CreditCardPaymentsController < ApplicationController
	before_action :logged_in_user

  before_action :set_credit_card_payment, only: [:show, :edit, :update, :destroy]

  # GET /credit_card_payments
  # GET /credit_card_payments.json
  def index
    @credit_card_payments = CreditCardPayment.all
  end

  # GET /credit_card_payments/1
  # GET /credit_card_payments/1.json
  def show
  end

  # GET /credit_card_payments/new
  def new
    @credit_card_payment = CreditCardPayment.new
  end

  # GET /credit_card_payments/1/edit
  def edit
  end

  # POST /credit_card_payments
  # POST /credit_card_payments.json
  def create
    @credit_card_payment = CreditCardPayment.new(credit_card_payment_params)
		@credit_card_payment.order = current_order
		@credit_card_payment.amount = @credit_card_payment.order.subtotal

    respond_to do |format|
      if @credit_card_payment.save
        format.html { redirect_to root_path, notice: 'Credit Card Payment was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @credit_card_payment.errors, status: :unprocessable_entity }
      end

    end
    destroy_session_order
  end

  # PATCH/PUT /credit_card_payments/1
  # PATCH/PUT /credit_card_payments/1.json
  def update
    respond_to do |format|
      if @credit_card_payment.update(credit_card_payment_params)
        format.html { redirect_to edirect_to root_path, notice: 'Credit Card Payment was successfully updated.' }
      else
        format.html { render :edit }
        format.json { render json: @credit_card_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /credit_card_payments/1
  # DELETE /credit_card_payments/1.json
  def destroy
    @credit_card_payment.destroy
    respond_to do |format|
      format.html { redirect_to credit_card_payments_url, notice: 'Credit Card Payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_credit_card_payment
      @credit_card_payment = CreditCardPayment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def credit_card_payment_params
      params.require(:credit_card_payment).permit(:amount, :responseCode, :responseMessage, :xref, :amountReceived, :transactionID, :cardNumberMask, :cardTypeCode, :cardType)
    end
end
