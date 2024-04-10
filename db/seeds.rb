# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "resetting data base..."
User.destroy_all
Film.destroy_all
List.destroy_all
FilmLibrary.destroy_all

puts "creating entries..."

## USERS

admin = User.create!(
  email: "leehwen@email.com",
  password: "password",
)

list1 = List.create!(
  name: "Fantasy",
  user: admin
)

list2 = List.create!(
  name: "Romcoms",
  user: admin
)

list2 = List.create!(
  name: "Arthouse",
  user: admin
)

puts "seeding entries done!"
