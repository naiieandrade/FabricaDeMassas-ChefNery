json.extract! payment, :id, :amount, :responseCode, :responseMessage, :xref, :amountReceived, :transactionID, :cardNumberMask, :cardTypeCode, :cardType, :created_at, :updated_at
json.url payment_url(payment, format: :json)
