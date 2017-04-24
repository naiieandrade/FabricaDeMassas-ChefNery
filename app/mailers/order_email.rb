class OrderEmail < ActionMailer::Base
	default from: "chefenerymassas@gmail.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_email.order_request.subject
  #
  def order_request(user, order)
    @greeting = "Olá chefe Nery"
    @user = user
    @order = order
    mail to: "chefenerymassas@gmail.com", subject:  "Novo pedido efetuado!"
  end

  def order_confirmation(user, order)
    @greeting = "Olá,"
    @user = user
    @order = order
    mail to: @user.email, subject:  "Confirmação de pedido!"
  end

end
