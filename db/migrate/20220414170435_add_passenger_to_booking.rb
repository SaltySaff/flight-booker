class AddPassengerToBooking < ActiveRecord::Migration[6.1]
  def change
    add_reference :bookings, :passenger, foreign_key: true
  end
end
