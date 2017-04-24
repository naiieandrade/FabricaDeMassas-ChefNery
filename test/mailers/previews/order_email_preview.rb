# Preview all emails at http://localhost:3000/rails/mailers/order_email
class OrderEmailPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/order_email/order_request
  def order_request
    OrderEmail.order_request
  end

end
