# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

require 'open-uri'
require 'ostruct'

puts "Cleaning database..."
Curse.destroy_all

puts "Fetching Unsplash images..."
# Search for 'art gallery' and get 10 photos
photos = Unsplash::Photo.search("art gallery", 1, 10)

puts "Creating Curses..."
10.times do |i|
  photo = photos[i] || photos.sample

  start_date = Faker::Date.forward(days: 30)

  curse = Curse.create!(
    title: Faker::Educator.course_name,
    about: Faker::Lorem.paragraphs(number: 3).join("\n\n"),
    address: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    start_date: start_date,
    end_date: Faker::Date.between(from: start_date, to: start_date + 60.days),
    curse_type: Curse.curse_types.keys.sample,
    apply_url: Faker::Internet.url
  )

  if photo
    puts "Attaching cover image for #{curse.title}..."
    begin
      file = URI.open(photo.urls.regular)
      curse.cover.attach(io: file, filename: "cover_#{i}.jpg", content_type: 'image/jpeg')
    rescue => e
      puts "Failed to attach image: #{e.message}"
    end
  end

  puts "Created Curse: #{curse.title}"
end

puts "Finished! Created #{Curse.count} curses."
