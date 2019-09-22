class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?
    
    private   

    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end
    
    def can_edit?(model)
        bool = false
        model.observations.each do |ob|
            if ob.user_id == session[:user_id]
                bool = true
            end
        end
        bool
    end

    def can_edit_observation?(obs)
        bool = false
        if obs.user_id == session[:user_id]
            bool = true
        end
        bool
    end
end
