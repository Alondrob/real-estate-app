class UsersController < ApplicationController

    before_action :redirect_if_not_admin, except: [:show]
    before_action :redirect_if_not_logged_in, only: [:show]

    def new
        @user = User.new
    end

    def create
        user = User.new(user_params)
        user.admin = current_user
        if user.save
            redirect_to users_path
        else
            redirect_to new_user_path
        end        
    end

    def index   
        @users = current_user.users
    end

    def show
        @user = User.find(params[:id])
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        user = User.find(params[:id])
        if user.update(user_params)
            redirect_to user_path(user)
        else
            redirect_to edit_user_path(user)
        end        
    end

    def destroy 
        user = User.find(params[:id])
        user.destroy
        redirect_to users_path
    end

    private

    # strong params
    def user_params
        params.require(:user).permit(:email, :first_name, :last_name, :password)
    end
end