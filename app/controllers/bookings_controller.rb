class BookingsController < ApplicationController
  def new
    @flight = Flight.where(id: flight_params[:flight]).first
    p @flight
  end

  private

  def flight_params
    params.permit(:flight, :commit)
  end
end
