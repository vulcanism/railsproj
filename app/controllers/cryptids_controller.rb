class CryptidsController < ApplicationController

    def index
        @cryptids = Cryptid.all
    end
    
    def new
        @cryptid = Cryptid.new
    end

    def create
        @cryptid = Cryptid.new(cryptid_params)
        if @cryptid.save
         redirect_to cryptids_path(@cryptid)
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