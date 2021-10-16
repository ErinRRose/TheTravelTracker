class RatingsController < ApplicationController

    def new
        if @destination = Destination.find_by_id(params[:destination_id])
            @rating = @destination.ratings.build
        else
            @rating = Rating.new
        end

    end    

    def create
        @rating = current_user.ratings.build(rating_params)
        if rating.save
            redirect_to rating_path(@rating)
        else 
            render :new
        end

    end

    def show
        @rating = Rating.find_by_id(params[:id])
    end

    def index
        @destination = Destination.find_by_id(params[:destination_id])
        @ratings = @destination.ratings
    end

    private

    def rating_params
        params.require(:rating).permit(:destination_id, :scale, :note)
    end

end
