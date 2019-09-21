class CryptidsController < ApplicationController

    def index
        @cryptids = Cryptid.all
    end
    
    def new
        @cryptid = Cryptid.new
    end

    def create
        @cryptid = Cryptid.find_or_create_by(id: params[:cryptid][:id])
        if @cryptid.id == nil
          @cryptid = cryptid.new(cryptid_params)
        end
        @observation = Observation.find(params[:cryptid][:observation_id])
    
     
        if @observation.user_id != session[:user_id]
          flash[:notice] = "Error, does not belong to user"
          @observations = Observation.all
          render 'observations/index'
        elsif @cryptid.save
          @observation.cryptid = @cryptid
          @observation.save
          redirect_to @cryptid         
        else          
          render :new
        end
      end

    def show
        @cryptid = Cryptid.find_by(id: params[:id])
    end

    private

    def cryptid_params
        params.require(:cryptid).permit(:name, :location, :size, :classification)
    end


end