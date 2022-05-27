# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Creating treks"
default_user = User.create!(
  email: "user@user.com",
  password: "123456",
  first_name: "Alex",
  last_name: "Wu",
  gender: "Male",
  age: 23
)

andes = Trek.new(
  user: default_user,
  name: "Amazing Andes Mountains",
  price: 2750,
  start_location: "Andes Mountains",
  difficulty: "Hard",
  duration_days: 10,
  description: "Climb the legendary Inca Trail to the cloud forest citadel of Machu Picchu."
)
image_url = "https://source.unsplash.com/MzZQQ8knzTw"
downloaded_image = URI.open(image_url)
andes.photo.attach(io: downloaded_image, filename: "andes-#{andes.id}")
andes.save

everest = Trek.new(
  user: default_user,
  name: "Conquering Mt. Everest",
  price: 7900,
  start_location: "Nepal",
  difficulty: "Extreme",
  duration_days: 14,
  description: "Few places are steeped in as much legend as the Khumbu Valley of Nepal. Embark on a captivating journey to the world's highest peak."
)
image_url = "https://source.unsplash.com/zATDM3xbOBI"
downloaded_image = URI.open(image_url)
everest.photo.attach(io: downloaded_image, filename: "everest-#{everest.id}")
everest.save

highland = Trek.new(
  user: default_user,
  name: "West Highland Way",
  price: 1950,
  start_location: "Scotland",
  difficulty: "Moderate",
  duration_days: 7,
  description: "See the most breathtaking Scottish landscapes. You will walk through moorland, mountain passes and glens."
)
image_url = "https://source.unsplash.com/WZ86D3GLSCw"
downloaded_image = URI.open(image_url)
highland.photo.attach(io: downloaded_image, filename: "highland-#{highland.id}")
highland.save

blanc = Trek.new(
  user: default_user,
  name: "Tour du Mont Blanc",
  price: 2400,
  start_location: "Chamonix",
  difficulty: "Hard",
  duration_days: 8,
  description: "Trek across France, Italy and Switzerland while making lifelong friends and enjoying delicious local cuisine."
)
image_url = "https://source.unsplash.com/6ABDAHKjie4"
downloaded_image = URI.open(image_url)
blanc.photo.attach(io: downloaded_image, filename: "blanc-#{blanc.id}")
blanc.save

10.times do |n|
  print "."
  user = User.create!(
    email: "owner#{n + 1}@user.com",
    password: "123456",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    gender: %w[Male Female].sample,
    age: rand(16..90)
  )

  2.times do
    trek = Trek.new(
      user: user,
      name: Faker::Mountain.name,
      price: rand(500..4900),
      start_location: Faker::Games::Pokemon.location,
      difficulty: %w[Easy Moderate Hard Extreme].sample,
      duration_days: rand(1..7),
      description: Faker::Lorem.paragraph
    )
    image_url = "https://source.unsplash.com/collection/1705422"
    downloaded_image = URI.open(image_url)
    trek.photo.attach(io: downloaded_image, filename: "trek-#{trek.id}")
    trek.save
  end
end
