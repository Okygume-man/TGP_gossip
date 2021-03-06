# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'table_print'

City.destroy_all
User.destroy_all
Gossip.destroy_all

25.times do
  City.create(name: Faker::Address.city, zip_code: Faker::Address.zip_code)
end

puts "J'ai créer 25 cités"
25.times do 
	User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city: City.all.sample)
end

puts "J'ai crées 25 utilisateurs"

25.times do 
	Gossip.create(user_id: rand(User.first.id..User.last.id), title: Faker::Lorem.words(number: 1), content: Faker::ChuckNorris.fact)
end

puts "J'ai crées 25 gossips"
