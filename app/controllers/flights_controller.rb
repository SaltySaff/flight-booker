class FlightsController < ApplicationController
  def index
    @flights = Flight.all
    @departure_options = Airport.all.map { |airport| [airport.code, airport.id] }
    @arrival_options = Airport.all.map { |airport| [airport.code, airport.id] }
    @date_options = Flight.order(:departure_datetime).all.map { |f| [f.departure_datetime.strftime('%d/%m/%Y'), f.departure_datetime.to_date] }

    if flight_params.empty?
      @results = []
    else
      @results = @flights.where(departure_airport_id: flight_params[:departure_airport_id])
      @results = @results.where(arrival_airport_id: flight_params[:arrival_airport_id])

      string_to_datetime = DateTime.parse(flight_params[:departure_datetime])
      @results = @results.where(departure_datetime: string_to_datetime.all_day)
    end
  end

  private

  def flight_params
    params.permit(:departure_airport_id, :arrival_airport_id, :departure_datetime)
  end


end
