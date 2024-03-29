

require 'faker'
require 'date'
require "open-uri"

User.destroy_all

CITIES = [
  "Manchester",
  "Birmingham",
  "London",
  "Liverpool",
  "Leeds"
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


puts "----- Création des utilisateurs -----"
image = Cloudinary::Uploader.upload(Rails.root.join('app', 'assets', 'images', 'nour.jpg'), public_id: 'nour')
$image_url = image['url']

users = []
avatars = ['av1.jpg', 'av2.jpg', 'av3.jpg']

(1..5).each do |i|
  user = User.create!(email: "test#{i}@test.com", password: "test123", pseudo: "user#{i}")
  avatar_file = avatars.sample
  avatar = Cloudinary::Uploader.upload(Rails.root.join('app', 'assets', 'images', avatar_file), public_id: avatar_file)
  user.avatar.attach(io: URI.open(avatar['url']), filename: avatar_file, content_type: 'image/png')
  users << user
end

# Fin de la création de 5 utilisateurs
puts "----- Fin de la création de 5 utilisateurs -----"


puts "----- Création des voitures -----"
vehicles = 10.times.map { Faker::Vehicle.make_and_model.split }
BRANDS = vehicles.map(&:first).uniq
MODELS = vehicles.map(&:last).uniq

selected_brands = BRANDS.sample(5)
selected_models = MODELS.sample(5)

car_counter = 0

CITIES.each do |city|
  selected_brands.each do |brand|
    selected_models.each do |model|
      car = Car.new({
        brand: brand,
        model: model,
        year_of_production: Faker::Vehicle.year,
        address: "#{Faker::Address.street_address}, #{city}",
        city: city,
        price_per_day: rand(50..350)
      })
      user = users.sample
      car.user = user
      if ENV["CLOUDINARY_URL"]
        file = URI.open(IMAGES_URL.shuffle.pop)
        car.photo.attach(io: file, filename: "#{rand(1000)}.png", content_type: "image/png")
      end
      car.save!
      car_counter += 1
      puts "Créé #{car_counter} voitures"
    end
  end
end

puts "----- Fin de la création des voitures -----"



puts "----- Création de 25 réservations -----"

# 25.times do
#     duration = rand(1..5).to_i

#     car = Car.all.sample

#     existing_bookings = car.bookings.order(:starts_at)
#     start_date = Date.today

#     existing_bookings.each do |booking|
#         break unless start_date >= booking.starts_at && start_date < booking.ends_at
#         start_date = booking.ends_at + 1
#     end
#     end_date = start_date + duration.days

#     new_booking = Booking.new({
#         car: car,
#         starts_at: start_date,
#         ends_at: end_date
#     })

#     new_booking.user = users.sample
#     new_booking.save!
# end

puts "----- Fin de la création de 25 réservations -----"
