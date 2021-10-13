class DestinationsController < ApplicationController

    def new
        @destination = Destination.new
    end
    

    def create
        @destination = Destination.new(destination_params)
        @destination.user_id = session[:user_id]
        if @destination.save
            redirect_to destination_path(@destination)
        else
           render :new
        end
    end 
    private

    def destination_params
        params.require(:destination).permit(:name, :description)
    end
end
