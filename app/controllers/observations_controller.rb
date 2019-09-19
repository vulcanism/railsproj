class ObservationsController < ApplicationController

    def index
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
        @observation = Observation.find_by(id: params[:id])
    end

    private

    def observation_params
        params.require(:observation).permit(:name, :date, :note, :user_id, :cryptid_id)
    end

end