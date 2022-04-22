class Flight < ApplicationRecord
  attr_accessor :any_date
  
  validates :departure_airport_id, presence: true
  validate :airport_ids_are_different

  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"
  has_many :bookings, dependent: :destroy
  has_many :passengers, through: :bookings

  def airport_ids_are_different
    if self.departure_airport_id == self.arrival_airport_id
      errors.add(:departure_airport_id, 'must be different to arrival_airport_id')
      errors.add(:arrival_airport_id, 'must be different to departure_airport_id')
    end
  end

  def self.search_flights(params)
    flights = Flight.all

    flights = flights.joins(:departure_airport).where(airports: { code: :departure_airport_id })
  end
end
