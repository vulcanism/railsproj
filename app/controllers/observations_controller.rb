class ObservationsController < ApplicationController

    def index
        if params[:cryptid_id]        
            @observations = Cryptid.find_by(id: params[:cryptid_id]).observations
        else
            @observations = Observation.all
        end        
    end
    
    def new
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
        @observation = Observation.find(params[:id])
    end

    private

    def observation_params
        params.require(:observation).permit(:name, :date, :note, :user_id)
    end

end