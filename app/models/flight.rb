class Flight < ApplicationRecord
  validates :departure_airport_id, presence: true
  validate :airport_ids_are_different

  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"

  def airport_ids_are_different
    if self.departure_airport_id == self.arrival_airport_id
      errors.add(:departure_airport_id, 'must be different to arrival_airport_id')
      errors.add(:arrival_airport_id, 'must be different to departure_airport_id')
    end
  end
end
