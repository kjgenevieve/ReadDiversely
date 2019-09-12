class ApplicationController < ActionController::Base
    helper_method :current_user

    def index
    end
    
    def current_user
        session[:id]
    end

    private
    def require_logged_in
        redirect_to controller: 'sessions', action: 'new' unless current_user
    end
end




# XYZ # REDIRECT
# def hello
#   redirect_to controller: 'sessions', action: 'new' unless session[:name]
# end