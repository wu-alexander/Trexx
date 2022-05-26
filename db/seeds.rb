# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Creating treks"
User.create!(
  email: "user@user.com",
  password: "123456",
  first_name: "Alex",
  last_name: "Wu",
  gender: "Male",
  age: 23
)

10.times do |n|
  print "."
  user = User.create!(
    email: "owner#{n + 1}@user.com",
    password: "123456",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    gender: %w[Male Female Other].sample,
    age: rand(16..90)
  )

  2.times do
    Trek.create!(
      user: user,
      name: Faker::Mountain.name,
      price: Faker::Types.rb_integer,
      start_location: Faker::Games::Pokemon.location,
      difficulty: %w[Easy Moderate Hard Extreme].sample,
      duration_days: rand(1..7),
      description: Faker::Lorem.paragraph
    )
  end
end
