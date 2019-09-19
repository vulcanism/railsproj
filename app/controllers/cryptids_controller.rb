class CryptidsController < ApplicationController

    def index
        @cryptids = Cryptid.all
    end
    
    def new
        @cryptid = Cryptid.new
    end

    def create
        @cryptid = Cryptid.new(cryptid_params)
        @observation = Observation.find(params[:cryptid][:observation_id])

        if @observation.user_id != session[:user_id]
            flash[:message] = "Error: Does not belong to user"
            @observations = Observation.all
            render "observations/index"
        elsif @cryptid.save
            @observation.cryptid = @cryptid
            @observation.save        
        else
            render :new
        end
    end

    def show
        @cryptid = Cryptid.find_by(id: params[:id])
    end

    private

    def cryptid_params
        params.require(:cryptid).permit(:name, :location, :size, :type)
    end


end