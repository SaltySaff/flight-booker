class FlightsController < ApplicationController
  def index
    @flights = Flight.all
    @departure_options = Airport.all.map { |airport| [airport.code, airport.id] }
    @arrival_options = Airport.all.map { |airport| [airport.code, airport.id] }
    @date_options = Flight.all.map { |f| [f.departure_datetime.strftime('%d/%m/%Y'), f.departure_datetime] }.uniq

    if flight_params.empty?
      @results = []
    else
      @results = @flights.where(flight_params)
    end
  end

  private

  def flight_params
    params.permit(:departure_airport_id, :arrival_airport_id)
  end


end
