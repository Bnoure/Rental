# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)



# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


require 'faker'
require 'date'
require "open-uri"

User.destroy_all

ADDRESSES = [
  '1 Place du Capitole, 31000, Toulouse',
  '11 Allée Jules Guesde, 31000, Toulouse',
  '2 Rue de Metz, 31000, Toulouse',
  '3 Rue Gabriel Péri, 31000, Toulouse',
  '4 Place Saint-Georges, 31000, Toulouse',
  '5 Rue Ozenne, 31000, Toulouse',
  '6 Rue Rivals, 31000, Toulouse',
  '7 Rue Alsace Lorraine, 31000, Toulouse',
  '8 Rue de la Pomme, 31000, Toulouse',
  '9 Rue de la Pomme, 31000, Toulouse',
]


IMAGES_URL = [

    "https://images.unsplash.com/photo-1549399542-7e3f8b79c341?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fHZvaXR1cmV8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=1170&q=80",

    "https://images.unsplash.com/photo-1532974297617-c0f05fe48bff?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80",

    "https://images.unsplash.com/photo-1519641471654-76ce0107ad1b?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",

    "https://images.unsplash.com/photo-1542362567-b07e54358753?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80",

    "https://images.unsplash.com/photo-1547038577-da80abbc4f19?q=80&w=1955&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80",

    "https://images.unsplash.com/photo-1503736334956-4c8f8e92946d?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80",

    "https://images.unsplash.com/photo-1544896478-d5b709d413c5?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1169&q=80",

    "https://images.unsplash.com/photo-1604940500627-d3f44d1d21c6?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80",

    "https://plus.unsplash.com/premium_photo-1664303367569-3df2942bda18?q=80&w=2078&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1171&q=80",

    "https://images.unsplash.com/photo-1458917816469-9499c76688e0?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80",

    "https://images.unsplash.com/photo-1623572435912-9940866dca4e?q=80&w=1999&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1169&q=80",

    "https://images.unsplash.com/photo-1571987502227-9231b837d92a?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80",

    "https://images.unsplash.com/photo-1536617621572-1d5f1e6269a0?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80",

    "https://images.unsplash.com/photo-1628632881998-53db224a524d?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80",

    "https://images.unsplash.com/photo-1623596240012-63ab3432fa1b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3Dauto=format&fit=crop&w=1237&q=80"
]

# CREATION OF 3 USERS
puts "----- CREATION OF 3 USERS -----"
image = Cloudinary::Uploader.upload(Rails.root.join('app', 'assets', 'images', 'nour.jpg')).to_s
$image_url = Cloudinary::Uploader.upload(Rails.root.join('app', 'assets', 'images', 'nour.jpg'))['url']

users = []

user1 = User.create!(email: "test@test.com", password: "test123", pseudo: "john")
avatar1 = Cloudinary::Uploader.upload(Rails.root.join('app', 'assets', 'images', 'av1.jpg'))
user1.avatar.attach(io: URI.open(avatar1['url']), filename: 'av1.jpg', content_type: 'image/png')
users << user1

user2 = User.create!(email: "test1@test.com", password: "test123", pseudo: "marta")
avatar2 = Cloudinary::Uploader.upload(Rails.root.join('app', 'assets', 'images', 'av2.jpg'))
user2.avatar.attach(io: URI.open(avatar2['url']), filename: 'av2.jpg', content_type: 'image/png')
users << user2

user3 = User.create!(email: "test2@test.com", password: "test123", pseudo: "marc")
avatar3 = Cloudinary::Uploader.upload(Rails.root.join('app', 'assets', 'images', 'av3.jpg'))
user3.avatar.attach(io: URI.open(avatar3['url']), filename: 'av3.jpg', content_type: 'image/png')
users << user3


# END OF CREATION OF 5 USERS
puts "----- END OF CREATION OF 3 USERS -----"

# CREATION OF 15 CARS
puts "----- CREATION OF 15 CARS -----"

i = 0

15.times do
    car = Car.new({brand: Faker::Vehicle.make, model: Faker::Vehicle.model, year_of_production: Faker::Vehicle.year, address: ADDRESSES.sample, price_per_day: rand(50..350)})
    car.user = User.all.reject { |user| user.cars.count > 5 }.sample
    if ENV["CLOUDINARY_URL"]
        file = URI.open(IMAGES_URL.shuffle.pop)
        car.photo.attach(io: file, filename: "#{i}.png", content_type: "image/png")
    end

    car.save!
end

# END OF CREATION OF 15 CARS
puts "----- END OF CREATION OF 15 CARS -----"


# CREATION OF 25 BOOKINGS
puts "----- CREATION OF 25 BOOKINGS -----"

25.times do
    duration = rand(1..5).to_i

    car = Car.all.sample
    existing_bookings = car.bookings.order(:starts_at)
    start_date = Date.today

    existing_bookings.each do |booking|
        break unless start_date >= booking.starts_at && start_date < booking.ends_at
        start_date = booking.ends_at + 1
    end
    end_date = start_date + duration.days

    new_booking = Booking.new({
        car: car,
        starts_at: start_date,
        ends_at: end_date
    })

    new_booking.user = users.sample
    new_booking.save!
end

puts "----- END OF CREATION OF 25 BOOKINGS -----"
