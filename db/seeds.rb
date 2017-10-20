# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Pin.destroy_all
p = [600,700,800,1000,1200,1400]

20.times do |i|
    Pin.create(titile:"Pin número #{i+1}", image: "http://lorempixel.com/#{p.sample}/#{p.sample}")
end
