class DestinationsController < ApplicationController
    before_action :set_destination, only:[:show, :edit, :update]
    before_action :redirect_if_not_logged_in

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

    def show
        @destination = Destination.find_by(id: params[:id])
    end

    def index
        @destinations = Destination.last(100)
    end

    def edit
        @destination = Destination.find_by(id: params[:id])
    end
  
    def update
      if @destination.update(destination_params)
        redirect_to destination_path(@destination)
      else
        render :edit
      end
    end
    private

    def destination_params
        params.require(:destination).permit(:name, :description)
    end

    def set_destination
        @destination = Destination.find_by(params[:id])
        redirect_to destination_path if !@destination
    end

end
