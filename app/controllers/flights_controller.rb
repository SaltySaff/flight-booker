class FlightsController < ApplicationController
  def index
    @flights = Flight.all
    @departure_options = Airport.all.map { |airport| [airport.name, airport.id] }
    @arrival_options = Airport.all.map { |airport| [airport.name, airport.id] }
    @passenger_number = flight_params[:passenger_number]

    unique_dates = Flight.order(:departure_datetime).map { |flight| flight.departure_datetime.to_date }.uniq
    @date_options = unique_dates.map { |date| [date.strftime('%d/%m/%Y'), date] }

    if flight_params.empty?
      @results = []
    elsif !flight_params[:any_date]
      # if any_date is not ticked, process date
      @results = @flights.where(departure_airport_id: flight_params[:departure_airport_id])
      @results = @results.where(arrival_airport_id: flight_params[:arrival_airport_id])

      string_to_datetime = DateTime.parse(flight_params[:departure_datetime])
      @results = @results.where(departure_datetime: string_to_datetime.all_day)
    else
      # otherwise, don't process date
      @results = @flights.where(departure_airport_id: flight_params[:departure_airport_id])
      @results = @results.where(arrival_airport_id: flight_params[:arrival_airport_id])
    end
  end

  private

  def flight_params
    params.permit(:departure_airport_id, :arrival_airport_id, :departure_datetime, :any_date, :passenger_number, :commit)
  end
end
