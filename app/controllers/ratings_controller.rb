class RatingsController < ApplicationController

    def new
        @destination = Destination.find_by_id(params[:destination_id])
        @rating = @destination.ratings.build
    end    

    def index
    end

end
