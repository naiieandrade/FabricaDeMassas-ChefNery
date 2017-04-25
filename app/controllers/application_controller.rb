class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def home_if_not_admin
    if current_user.nil? || !is_administrator(current_user)
      redirect_to root_url
    end
  end

  include SessionsHelper
  include OrdersHelper
  include CouriersHelper
end
