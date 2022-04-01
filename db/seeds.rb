# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Flight.delete_all
Airport.delete_all

Airport.create(code: 'LHR')
Airport.create(code: 'LGW')
Airport.create(code: 'DUB')
Airport.create(code: 'EDI')
Airport.create(code: 'GIB')

def random_airport_id
  Airport.where.not(id: nil).sample.id
end

def rand_datetime
  rand(1.years).seconds.from_now
end

6.times do
  Flight.create(departure_airport_id: random_airport_id, arrival_airport_id: random_airport_id, departure_datetime: rand_datetime, duration: rand(1000))
end
