# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Flight.delete_all
Airport.delete_all

Airport.create(code: 'LHR', name: 'Heathrow Airport')
Airport.create(code: 'LGW', name: 'Gatwick Airport')
Airport.create(code: 'DUB', name: 'Dublin Airport')
Airport.create(code: 'EDI', name: 'Edinburgh Airport')
Airport.create(code: 'GIB', name: 'Gibraltar International Airport')
Airport.create(code: 'LBA', name: 'Leeds Bradford Airport')
Airport.create(code: 'JFK', name: 'John F. Kennedy International Airport')
Airport.create(code: 'CDG', name: 'Paris Charles de Gaulle Aiport')
Airport.create(code: 'HND', name: 'Haneda Airport')
Airport.create(code: 'NRT', name: 'Narita International Airport')
Airport.create(code: 'PEK', name: 'Beijing Capital International Airport')
Airport.create(code: 'ORD', name: 'O\'Hare International Airport')
Airport.create(code: 'BER', name: 'Berlin Brandenburg Airport')
Airport.create(code: 'GLA', name: 'Glasgow Airport')
Airport.create(code: 'NGO', name: 'Chubu Centrair International Airport')
Airport.create(code: 'SFO', name: 'San Francisco International Airport')

def random_airport_id
  Airport.where.not(id: nil).sample.id
end

def rand_datetime
  rand(1.years).seconds.from_now.beginning_of_minute
end

10000.times do
  Flight.create(departure_airport_id: random_airport_id, arrival_airport_id: random_airport_id, departure_datetime: rand_datetime, duration: rand(1000))
end
