# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

Booking.destroy_all
Ride.destroy_all
EndPoint.destroy_all
StartPoint.destroy_all
User.destroy_all



# Seed users
puts 'creating users...'

user_1 = User.create!(
  first_name:"Mathieu",
  last_name:"Bonfils",
  password:"password",
  email:"testmat@test.fr",
  sex:"homme",
  birth_date: Date.parse("23/07/1992"),
  phone_number:"0699115900",
  photo_url: "https://media-exp2.licdn.com/media/AAEAAQAAAAAAAA2DAAAAJDc5N2EzZDc1LTdlMmMtNDc0MS05NTlmLTk3NzBjZjIwODg2YQ.jpg"
  )

user_2 = User.create!(
  first_name:"Omar",
  last_name:"Sy",
  password:"password",
  email:"testv@test.fr",
  sex:"homme",
  birth_date: Date.parse("02/02/1982"),
  phone_number:"0622382238",
  photo_url: "http://rashtag.fr/wp-content/uploads/2016/02/omar-sy.jpg"

  )

user_3 = User.create!(
  first_name:"Sebastien",
  last_name:"Saunier",
  password:"password",
  email:"tests@test.fr",
  sex:"homme",
  birth_date: Date.parse("03/03/1983"),
  phone_number:"0725345676",
  photo_url: "http://kitt.lewagon.com/placeholder/users/ssaunier"
  )

user_4 = User.create!(
  first_name:"Sami",
  last_name:"Naceri",
  password:"password",
  email:"testsa@test.fr",
  sex:"homme",
  birth_date: Date.parse("03/03/1953"),
  phone_number:"0618283947",
  photo_url: "http://www.insolitemag.com/wp-content/uploads/2017/08/343175.1.jpg"
  )

user_5 = User.create!(
  first_name:"Chloé",
  last_name:"Bauchet",
  password:"password",
  email:"testcl@test.fr",
  sex:"femme",
  birth_date: Date.parse("03/03/1990"),
  phone_number:"0606071228",
  photo_url: "https://avatars2.githubusercontent.com/u/32484761?v=4"
  )

user_6 = User.create!(
  first_name:"Killian",
  last_name:"Avocat",
  password:"password",
  email:"testk@test.fr",
  sex:"homme",
  birth_date: Date.parse("03/03/1990"),
  phone_number:"0626051993",
  photo_url: "https://avatars1.githubusercontent.com/u/22000551?s=400&v=4"
  )

user_7 = User.create!(
  first_name:"Scarlett",
  last_name:"scarlett johansson",
  password:"password",
  email:"testa@test.fr",
  sex:"homme",
  birth_date: Date.parse("03/03/1990"),
  phone_number:"06 77 99 11 00",
  photo_url: "http://i.f1g.fr/media/ext/1900x1900/madame.lefigaro.fr/sites/default/files/img/2017/03/le-parcours-capillaire-de-scarlett-johansson-photo-14.jpg"
  )

user_8 = User.create!(
  first_name:"Mathis",
  last_name:"Clamens",
  password:"password",
  email:"testm@test.fr",
  sex:"homme",
  birth_date: Date.parse("23/07/1992"),
  phone_number:"0713141516",
  photo_url: "http://kitt.lewagon.com/placeholder/users/mathisclm"
  )

user_9 = User.create!(
  first_name:"Cecile",
  last_name:"Varin",
  password:"password",
  email:"testc@test.fr",
  sex:"femme",
  birth_date: Date.parse("03/03/1983"),
  phone_number:"0678545353",
  )
puts "#{User.count} users created"

# def seed_photo(file_name)
#   File.open(File.join(Rails.root, "/app/assets/images/#{file_name}"))
# end

# Seed end_points
puts 'creating end points...'

end_point_1 = EndPoint.create!(
  address: "2 Rue du Puits de la Muse 13122 Ventabren",
  long: 5.293873,
  lat: 43.538265
  )

end_point_5 = EndPoint.create!(
  address: "17 Grand Rue 13122 Ventabren",
  long: 5.292946,
  lat: 43.539087
  )

end_point_3 = EndPoint.create!(
  address: "3 Chemin de Tabari 13122 Ventabren",
  long: 5.291916,
  lat: 43.539530
  )

end_point_2 = EndPoint.create!(
  address: "11 Rue des Lotins 13510 Éguilles",
  long: 5.351738,
  lat: 43.570154
  )

end_point_4 = EndPoint.create!(
  address: "26 Rue Chante Pleure 13790 Éguilles",
  long: 5.351924,
  lat: 43.570214
  )

end_point_6 = EndPoint.create!(
  address: "12 place Saint-Anne 13450 Grans",
  long: 5.063308,
  lat: 43.606731
  )

end_point_7 = EndPoint.create!(
  address: "12 place Saint-Anne 13450 Grans",
  long: 5.063308,
  lat: 43.606731
  )




puts "#{EndPoint.count} end points created"


# Seed start_points
puts 'creating start points...'

start_point_1 = StartPoint.create!(
  station: "Aix-en-Provence TGV",
  long: 5.317436,
  lat: 43.456249
  )

start_point_2 = StartPoint.create!(
  station: "Lille",
  long: 5.380316,
  lat: 43.302852
  )

start_point_3 = StartPoint.create!(
  station: "Avigon TGV",
  long: 5.380316,
  lat: 43.302852
  )

puts "#{StartPoint.count} start points created"

# Seed rides
puts 'creating rides...'
rides = [

# train Aix-en-Provence TGV le 15

  {
    train_ref: "6128",
    train_arrival_at: DateTime.new(2017, 12, 15, 8, 57),
    user: user_1, #mat bonfils
    passengers_allowed: 3,
    start_point: start_point_1,
    end_point: end_point_3,
    description: "Rendez-vous devant le Tabac de la gare",
    car_model: "Mazerati",
    price_cents: 350
  },

  {
    train_ref: "6129",
    train_arrival_at: DateTime.new(2017, 12, 15, 20, 46),
    user: user_6, #killian
    passengers_allowed: 3,
    start_point: start_point_1,
    end_point: end_point_4,
    description: "Rdv devant chez Paul ! On le trouve facilement dans la gare.",
    car_model: "206",
    price_cents: 300
   },

  {
    train_ref: "6129",
   train_arrival_at: DateTime.new(2017, 12, 15, 20, 46),
    user: user_4, #sami naceri
    passengers_allowed: 3,
    start_point: start_point_1,
    end_point: end_point_1,
    description: "Rendez-vous au tabac (attention voiture non fumeur)",
    car_model: "206",
    price_cents: 400
   },

    {
    train_ref: "6129",
    train_arrival_at: DateTime.new(2017, 12, 15, 20, 46),
    user: user_5, #chloe
    passengers_allowed: 4,
    start_point: start_point_1,
    end_point: end_point_5,
    description: "Rdv devant chez Paul, j'en profiterai pour prendre un Sandwich ! ",
    car_model: "Peugeot 406",
    price_cents: 300
   },

      {
    train_ref: "6130",
    train_arrival_at: DateTime.new(2017, 12, 15, 21, 23),
    user: user_7, #scarlett
    passengers_allowed: 4,
    start_point: start_point_1,
    end_point: end_point_5,
    description: "Rdv devant chez Paul, j'en profiterai pour prendre un Sandwich !",
    car_model: "206",
    price_cents: 400
   },

     {
    train_ref: "6130",
    train_arrival_at: DateTime.new(2017, 12, 15, 21, 23),
    user: user_2, #omar
    passengers_allowed: 4,
    start_point: start_point_1,
    end_point: end_point_4,
    description: "On se rejoint 5 min après l'arrivée du train,
    voila mon portable : 0612345678  ",
    car_model: "206",
    price_cents: 500
   },


      {
    train_ref: "6131",
    train_arrival_at: DateTime.new(2017, 12, 15, 22, 45),
    user: user_3, #seb s
    passengers_allowed: 4,
    start_point: start_point_1,
    end_point: end_point_2,
    description: "On se rejoint 5 min après l'arrivée du train,
    voila mon portable : 0612345678  ",
    car_model: "206",
    price_cents: 350
   },


# train Aix-en-Provence TGV le 18
 {
    train_ref: "6132",
    train_arrival_at: DateTime.new(2017, 12, 18, 11, 00),
    user: user_2,
    passengers_allowed: 1,
    start_point: start_point_1,
    end_point: end_point_5,
    description: "Rdv devant le Monop' dans la gare",
    car_model: "2 Cheveaux",
    price_cents: 450
   },

 {
    train_ref: "6123",
    train_arrival_at: DateTime.new(2017, 12, 17, 07, 00),
    user: user_1,
    passengers_allowed: 2,
    start_point: start_point_1,
    end_point: end_point_7,
    description: "Rdv devant le Monop' dans la gare",
    car_model: "206",
    price_cents: 300
   },

   {
    train_ref: "6134",
    train_arrival_at: DateTime.new(2017, 12, 17, 20, 30),
    user: user_1,
    passengers_allowed: 2,
    start_point: start_point_3,
    end_point: end_point_1,
    description: "Rdv devant le Monop' dans la gare",
    car_model: "206",
    price_cents: 300
   },


    {
    train_ref: "6135",
    train_arrival_at: DateTime.new(2017, 12, 17, 20, 00),
    user: user_1,
    passengers_allowed: 3,
    start_point: start_point_3,
    end_point: end_point_1,
    description: "Rdv devant le Monop' dans la gare",
    car_model: "206",
    price_cents: 300
   },

    {
    train_ref: "6136",
    train_arrival_at: DateTime.new(2017, 12, 17, 9, 00),
    user: user_1,
    passengers_allowed: 3,
    start_point: start_point_3,
    end_point: end_point_7,
    description: "Rdv devant le Monop' dans la gare",
    car_model: "206",
    price_cents: 380
   },

  ]

rides = Ride.create!(rides)
puts "#{Ride.count} rides created"

# Seed bookings
puts 'creating bookings...'

booking_1 = Booking.create!(
  ride: rides[0],
  user: user_1,
  passenger_number: 1
  )
puts "#{Booking.count} bookings created"

# Seeding stations
puts 'listing the 4700 FR stations... can take a while'
Rake::Task['db:seed_stations'].invoke
puts "#{StartPoint.count} stations created"

# Stations removed from csv file (please don't erase this comment)
# Aix-en-Provence TGV (to avoid double with seed file)
# 3497;Paris-L’Hôpital;paris-lhopital;8771213;87712133;46.911529;4.636941;;FR;Europe/Paris;f;f;f;t;f;f;FRGUQ;;t;;f;8704184;f;;f;;f;;f;;f;;f;;f;;;;f;;f;;f;;f;;f;f;;;;;;;;;;;;;;;;;;;
# 1129;Paris Gare du Nord;paris-gare-du-nord;8727103;87271031;48.880185;2.355151;4916;FR;Europe/Paris;f;f;f;f;f;f;FRCCP;PNO_TRANS;f;;f;8703374;f;;f;;f;;f;;f;;f;;f;;;;f;;f;;f;;f;;f;f;;;;;;;;;;;;;;;;;;;
# 1188;Paris Gare du Nord 2;paris-gare-du-nord-2;8727401;;;;4916;FR;Europe/Paris;f;f;f;f;f;f;FRCEZ;;t;;f;;f;;f;;f;;f;;f;;f;;f;;;;f;;f;;f;;f;;f;f;;;;;;;;;;;;;;;;;;;
# 4922;Paris Gare du Nord;paris-gare-du-nord;8727100;87271007;48.880185;2.355151;4916;FR;Europe/Paris;f;t;f;t;f;f;FRPNO;PNO;t;;f;8700014;f;;f;;f;;f;;f;;f;8727100;f;;;;f;;f;8700015;t;;f;FRPNO;t;t;;;;;;Parigi;;Parijs;Paříž;;Párizs;パリ;파리;Paryż;;Париж;;;巴黎
# 22584;Paris Gare du Nord Eurostar;paris-gare-du-nord-eurostar;;;48.880697;2.354598;4916;FR;Europe/Paris;f;f;f;f;f;f;;;f;;f;8798014;t;;f;;f;;f;;f;;f;;f;;;;f;;f;;f;;f;;f;f;4922;;;;;;;;;;;;;;;;;;
# 3389;Paris Gare de Lyon A;paris-gare-de-lyon-a;8768610;;;;4916;FR;Europe/Paris;f;f;f;f;f;f;FRGOO;;f;;f;;f;;f;;f;;f;;f;;f;;f;;;;f;;f;;f;;f;;f;f;;;;;;;;;;;;;;;;;;;
# 3390;Paris Gare de Lyon B;paris-gare-de-lyon-b;8768611;87686113;;;4916;FR;Europe/Paris;f;f;f;f;f;f;FRGOP;;f;;f;;f;;f;;f;;f;;f;;f;;f;;;;f;;f;;f;;f;;f;f;;;;;;;;;;;;;;;;;;;
# 10312;Paris Gare de Lyon RER;paris-gare-de-lyon-rer;8775858;;48.844605;2.373835;4916;FR;Europe/Paris;f;f;f;f;f;f;FRICS;;f;;f;8704185;f;;f;;f;;f;;f;;f;;f;;;;f;;f;;f;;f;;f;f;;;;;;;;;;;;;;;;;;;
