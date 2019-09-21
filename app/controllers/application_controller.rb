class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?
    
    private   

    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end
    
    def can_edit?(obj)
        bool = false
        obj.observations.each do |o|
            if o.user_id == session[:user_id]
                bool=true
            end
        end
        bool
    end
end
