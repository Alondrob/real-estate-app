class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        user = User.new(user_params)
        if user.save
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            redirect_to new_user_path
        end        
    end

    def show
        @user = User.find(params[:id])
    end

    private

    # strong params
    def user_params
        params.require(:user).permit(:email, :first_name, :last_name, :password)
    end
end