class UsersController < ApplicationController
    before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
    before_action :correct_user,   only: [:edit, :update]

    def index
        @users = User.all
    end
    def show
        @user = User.find(params[:id])
    end

    def new
        if !logged_in? || (is_administrator current_user)
            @user = User.new
        else
            redirect_to root_path
        end
    end

    def create
	    @user = User.new(user_params)  
	    if @user.save ||     (current_user != nil && !current_user.is_administrator)
	        log_in @user
	        flash[:success] = "Usuário criado com sucesso!"
	        redirect_to @user
    	elsif @user.save && current_user != nil && current_user.is_administrator
	        flash[:success] = "Administrador criado com sucesso!"
	        redirect_to users_url
	    else
	      render 'new'
    	end
  	end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update_attributes(user_params)
            flash[:success] = "Profile updated"
            redirect_to @user
        else
          render 'edit'
        end
    end

    def destroy
        User.find(params[:id]).destroy
        flash[:success] = "User deleted"
        redirect_to users_url
    end

    private

    def user_params
        if !(is_administrator current_user)
            params.require(:user).permit(:name, :email, :password, :password_confirmation)
        else
            params.require(:user).permit(:name, :email, :password, :password_confirmation, :is_administrator)
        end
    end
end
