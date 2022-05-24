# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Creating treks"

10.times do
  print "."
  user = User.create!(
    email: Faker::Internet.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    gender: %w[Male Female Other].sample,
    age: rand(16..90),
    password: Faker::Internet.password
  )

  2.times do
    Trek.create!(
      user: user,
      name: Faker::Name.name,
      price: Faker::Types.rb_integer,
      start_location: Faker::Games::Pokemon.location,
      difficulty: %w[Easy Moderate Hard Extreme].sample,
      duration_days: rand(1..21),
      description: Faker::Lorem.paragraph
    )
  end
end
