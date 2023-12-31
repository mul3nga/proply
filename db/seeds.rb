# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

User.destroy_all
puts "db cleaned"

puts 'Creating 3 fake users...'

n = 1

2.times do

  n += 1

  puts 'creating user'
  user = User.new(
    first_name: Faker::Name.name,
    last_name: Faker::Name.name,
    email: "user#{n}@lw.org",
    password: "password"
  )
  user.save!

  puts 'user created!'

  puts 'creating properties'

  2.times do
    property = Property.new(
      name: Faker::Travel::TrainStation.name(region: 'united_kingdom', type: 'metro'),
      description: Faker::Marketing.buzzwords,
      property_type: ["Apartment", "Detached", "Semi-detached", "Terraced", "Land", "Other"].sample,
      address: ["London", "Paris", "Madrid", "Luxembourg", "Mexico City", "Brimingham"].sample,
      user: user
    )

    chatroom = Chatroom.new
    chatroom.property = property

    file = URI.open("https://source.unsplash.com/random?georgian%20house%20uk")
    file2 = URI.open("https://source.unsplash.com/random?georgian%20bathroom%20uk")
    file3 = URI.open("https://source.unsplash.com/random?georgian%20livingroom%20uk")
    file4 = URI.open("https://source.unsplash.com/random?georigian%20kitchen%20uk")
    file5 = URI.open("https://source.unsplash.com/random?bedroom")

    property.images.attach(io: file, filename: "adiddas.png", content_type: "image/png")
    property.images.attach(io: file2, filename: "adiddas.png", content_type: "image/png")
    property.images.attach(io: file3, filename: "adiddas.png", content_type: "image/png")
    property.images.attach(io: file4, filename: "adiddas.png", content_type: "image/png")
    property.images.attach(io: file5, filename: "adiddas.png", content_type: "image/png")

    property.save!

    puts 'creating documents'
    2.times do
      doc = Document.new(
        title: ["IMP!!!", "TAX 2020", "AGREEMENT"].sample,
        document_type: ["EPC","Floor Plan","Council Tax", "Title", "Tenancy Agreement", "Other"].sample,
        property: property
      )
      doc.save!
    end
    puts 'creating tasks!'
    2.times do
      task = Task.new(
        start_date: Date.today+rand(10000),
        completion_date: Date.today+rand(10000),
        title: ["Renovation","Viewing", "Electrical Work", "Gas Work"].sample,
        property: property,
        user: user
      )
    end
  end

  puts 'properties made'
end
puts 'Finished making properties and users!'

# puts 'Creating 20 fake properties...'

puts "Creating users..."

Nii = User.create(first_name: "nii", last_name: "addo", email: "nii@gmail.com", password: "1234567")
David = User.create(first_name: "david", last_name: "lowe", email: "david@gmail.com", password: "1234567")

# puts "Creating users..."

# Property.create(name: "Sunny", property_type: "house", description: "3 bedroom house", address: "53 Old Bethnal Green Rd, Bethnal Green, London", user: nii)
# Property.create(name: "Fly", property_type: "cottage", description: "2 bedroom cottage", address: "12 Old road, Bromyard", user: nii)
# Property.create(name: "Pie", property_type: "house", description: "5 bedroom house", address: "66A Drayton Park, London", user: david)
# Property.create(name: "Womble", property_type: "house", description: "7 bedroom house", address: "226 Blackstock Rd, London", user: david)
# Property.create(name: "Friends", property_type: "house", description: "3 bedroom house", address: "52 St Thomas's Rd, Finsbury Park, London", user: nii)

# puts "Finished!"
