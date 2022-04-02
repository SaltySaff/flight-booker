class FlightsController < ApplicationController
  def index
    @flights = Flight.all
    @departure_options = Flight.all.map { |f| [f.departure_airport.code, f.departure_airport_id] }.uniq
    @arrival_options = Flight.all.map { |f| [f.departure_airport.code, f.departure_airport_id] }.uniq
    @date_options = Flight.all.map do |f|
      [f.departure_datetime.strftime('%d/%m/%Y'), f.departure_datetime].sort
    end
  end
end
