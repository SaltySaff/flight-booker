class BookingsController < ApplicationController
  def new
    @flight = Flight.where(id: flight_params[:flight]).first
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      redirect_to @booking
    else
      redirect_to root_path
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def flight_params
    params.permit(:flight)
  end

  def booking_params
    params.require(:booking).permit(:flight_id, passenger_attributes: %i[id name email])
  end
end
