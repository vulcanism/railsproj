class ObservationsController < ApplicationController
    before_action :set_observation, only: [:show, :edit, :update, :destroy]

    def index
        if params[:cryptid_id] && Cryptid.find_by(id: params[:cryptid_id])
            @observations = Cryptid.find_by(id: params[:cryptid_id]).observations          
        else
            @observations = Observation.all
        end    
    end
    
    def new
        @cryptid = Cryptid.find_by(id: params[:cryptid_id])
        @user = User.find(session[:user_id])
        @observation = Observation.new
    end

    def create
        @observation = Observation.new(observation_params)
        @observation.user_id = session[:user_id]               
        if @observation.save
            redirect_to @observation
        else
            render :new
        end
    end
    
    def show        
    end

    def edit
    end

    def update
        if @observation.user_id != session[:user_id]
            flash[:notice] = "Error, does not belong to user"
            @observations = Observation.all
            render :index
          elsif @observation.update(observation_params)
            redirect_to @observation
          else
            render :edit
          end
    end
    
    def destroy
        if @observation.user_id != session[:user_id]
            flash[:notice] = "Error, does not belong to user"
            @observations = Observation.all
            render :index
        else
            @observation.destroy
            redirect_to user_path(session[:user_id])
        end
    end

    private

    def set_observation
        @observation = Observation.find(params[:id])
    end
  

    def observation_params
        params.require(:observation).permit(:name, :date, :note, :user_id, :cryptid_id)
    end

end