module SessionsHelper

	def log_in(user)
	    session[:user_id] = user.id
	end

	def current_user
	  @current_user ||= User.find_by(id: session[:user_id])
	end

	def logged_in?
	  !current_user.nil?
	end

	def log_out
	  session.delete(:user_id)
	  @current_user = nil
	end

	# Confirms a logged-in user.
	def logged_in_user
	  unless logged_in?
	    flash[:danger] = "Please log in."
	    redirect_to login_url
	  end
	end

	# Confirms the correct user.
	def correct_user
		@user = User.find(params[:id])
		redirect_to(root_url) unless current_user?(@user)
	end

	# Returns true if the given user is the current user.
	def current_user?(user)
		user == current_user

	end

	def is_administrator(user)
		user != nil && user.is_administrator
	end


end
