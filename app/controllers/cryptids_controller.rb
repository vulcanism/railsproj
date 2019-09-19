class CryptidsController < ApplicationController

    def index
    end
    
    def new
    end

    def create
    end

    def show
    end

    private

    def cryptid_params
        params.require(:cryptid).permit(:name, :location, :size, :type)
    end


end