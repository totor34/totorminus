# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Booking.destroy_all
Ride.destroy_all
EndPoint.destroy_all
StartPoint.destroy_all
User.destroy_all

# Seed users
puts 'creating users...'

user_1 = User.create!(
  first_name:"Mathis",
  last_name:"Clamens",
  password:"password",
  email:"testm@test.fr",
  sex:"homme",
  birth_date: Date.parse("01/01/1981"),
  phone_number:"0111111111",
  photo_url: "http://kitt.lewagon.com/placeholder/users/mathisclm"
  )

user_2 = User.create!(
  first_name:"Victor",
  last_name:"Duperret",
  password:"password",
  email:"testv@test.fr",
  sex:"homme",
  birth_date: Date.parse("02/02/1982"),
  phone_number:"0222222222"
  )

user_3 = User.create!(
  first_name:"Cécile",
  last_name:"Varin",
  password:"password",
  email:"testc@test.fr",
  sex:"femme",
  birth_date: Date.parse("03/03/1983"),
  phone_number:"0333333333"
  )

puts "#{User.count} users created"

# def seed_photo(file_name)
#   File.open(File.join(Rails.root, "/app/assets/images/#{file_name}"))
# end

# Seed end_points
puts 'creating end points...'

end_point_1 = EndPoint.create!(
  address: "22 rue des 3 frères Carasso 13004 Marseille",
  long: 5.399851,
  lat: 43.304063
  )

puts "#{EndPoint.count} end points created"


# Seed start_points
puts 'creating start points...'

start_point_1 = StartPoint.create!(
  station: "Marseille Saint-Charles",
  long: 5.380316,
  lat: 43.302852
  )

puts "#{StartPoint.count} start points created"

# Seed rides
puts 'creating rides...'
rides = [
  {
    train_ref: "6129",
    train_arrival_date: Date.parse("17/12/2017"),
    train_arrival_time: Time.parse("22h57").strftime("%H:%M"),
    user: user_3,
    passengers_allowed: 3,
    start_point: start_point_1,
    end_point: end_point_1,
    description: "Rdv devant le Monop' dans la gare",
    car_model: "206"
  }
# ,
# {
#
#   },
  ]

rides = Ride.create!(rides)
puts "#{Ride.count} rides created"

# Booking rides
puts 'creating bookings...'

booking_1 = Booking.create!(
  ride: rides[0],
  user: user_1,
  passenger_number: 1
  )
puts "#{Booking.count} bookings created"

