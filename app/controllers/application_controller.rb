class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?, :is_admin?, :is_user?

    def current_user
        # memoization 
        @current_user ||= User.find_by(id: session[:user_id]) || Admin.find_by(id: session[:admin_id])
    end

    def redirect_if_not_logged_in
        redirect_to new_session_path unless logged_in?
    end

    def logged_in?
        current_user.present?
    end

    def is_admin?
        if logged_in?
            current_user.is_a?(Admin)
        else
            false
        end
    end

    def redirect_if_not_admin
        redirect_to new_session_path unless is_admin?   
    end

    

    def is_user?
        if logged_in?
            current_user.is_a?(User)
        else
            false
        end
    end

end