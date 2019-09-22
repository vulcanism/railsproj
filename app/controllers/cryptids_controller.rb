class CryptidsController < ApplicationController
    before_action :set_cryptid, only: [:show, :edit, :update, :destroy]
    helper_method :can_edit?

    def index
        @cryptids = Cryptid.all
    end

    def bylocation
        @cryptids = Cryptid.all.order_by_location
    end
    
    def new
        @cryptid = Cryptid.new
    end

    def create
        @cryptid = Cryptid.new(cryptid_params)
        if @cryptid.save
         redirect_to cryptids_path
        else
         render :new
        end 
      end

    def show        
        @observation = Observation.new        
    end

    def edit        
    end

    def update
        if !can_edit?(@cryptid)
            flash[:notice] = "Error, does not belong to user"
            render :index
        elsif @cryptid.update(cryptid_params)
            redirect_to @cryptid
        else
            render :edit
        end
    end

    def destroy
        if !can_edit?(@cryptid)
            flash[:notice] = "Error, does not belong to user"
            render :index
        else
            @cryptid.destroy
            redirect_to user_path(session[:user_id])
        end
    end

    private

    def set_cryptid
        @cryptid = Cryptid.find(params[:id])
      end

    def cryptid_params
        params.require(:cryptid).permit(:name, :location, :size, :classification)
    end


end