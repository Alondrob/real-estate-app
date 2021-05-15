class SessionsController < ApplicationController

    def new

    end

    def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            session.clear
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            redirect_to new_session_path
        end
    end

    def destroy
        session.clear
        redirect_to new_session_path
    end


end