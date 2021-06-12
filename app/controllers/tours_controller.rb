class ToursController < ApplicationController

    def new
        @tour = Tour.new
    end

    def create
       @tour = Tour.new(tour_params)
       if @tour.save
        redirect_to tour_path(@tour)
       else
        render :new
       end
    end

    def index
        @tours = current_user.tours
    end

    def show
        @tour = Tour.find(params[:id])
    end

private

def tour_params
        params.require(:tour).permit(:property_id, :client_id, :time)
end




end