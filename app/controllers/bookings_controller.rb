class BookingsController < ApplicationController
  def new
    @flight = Flight.where(id: flight_params[:flight]).first
    @booking = Booking.new
    @passenger_number = flight_params[:passenger_number]
  end

  def create
    @bookings = @passenger_number.to_i.times
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
    params.permit(:flight, :passenger_number, :commit)
  end

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: %i[id name email])
  end
end
