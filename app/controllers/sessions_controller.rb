class SessionsController < ApplicationController

    def index
    end
    
    def new
    end

    def create
        if params[:provider] == "github" 
            @user = User.find_or_create_by(uid: auth["uid"]) do |u|
            u.name = auth["info"]["name"]
            u.email = auth["info"]["email"]
            u.password = SecureRandom.hex         
        end
            @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)        
        
        else 
            @user = User.find_by(email: params[:user][:email])
                if @user && @user.authenticate(params[:user][:password])
                    session[:user_id] = @user.id 
                    redirect_to user_path(@user)
                else                
                    redirect_to login_path
                end
        end
    end

    def destroy
        session.clear
        redirect_to root_path
    end

    private

    def auth
        request.env['omniauth.auth']
    end
end