class AdminsController < ApplicationController

    def login
        
    end

    def logged_in
         admin = Admin.find_by(email: params[:email])
        if admin && admin.authenticate(params[:password])
            session.clear
            session[:admin_id] = admin.id
            redirect_to dashboard_path
        else
            redirect_to admin_login_path
        end
    end

    def dashboard

    end

    def logged_out
        session.clear
        redirect_to admin_login_path
    end




end