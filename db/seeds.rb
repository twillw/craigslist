# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
City.delete_all
City.allowed_types.each do |x|
  City.create!(name: "#{x}")
end

Category.delete_all
Category.allowed_types.each do |category|
  Category.create!(name: "#{category}")
end

Subcategory.delete_all
Subcategory.create(name:'Computer', category_id: Category.find_by(name: 'For Sale').id)
Subcategory.create(name: 'Books', category_id: Category.find_by(name: 'For Sale').id)
Subcategory.create(name: 'Programming', category_id: Category.find_by(name: 'Jobs').id)
Subcategory.create(name: 'Cleaning', category_id: Category.find_by(name: 'Jobs').id)
Subcategory.create(name: 'Houses', category_id: Category.find_by(name: 'Housing').id)
Subcategory.create(name: 'Apartment', category_id: Category.find_by(name: 'Housing').id)

Post.delete_all
Post.create!(title: 'Rideshare from Toronto to Ottawa',
  body: 
    %{Offering a Rideshare from Toronto to Ottawa. Must have GOOD
      hygiene (i.e. Don't smell bad). Preferrably students. Must shower
      prior to trip. Driver has the right to refuse entry to those who do 
      not shower.},
  price: 30.00,
  location: 'Ottawa',
  city_id: City.find_by(name: 'Ottawa').id,
  subcategory_id: Subcategory.find_by(name: 'Computer').id
  )
# . . .
Post.create!(title: 'Selling Best Ruby on Rails Textbook',
  body: 
    %{The book we have is currently good, but this textbook will blow your 
      mind. Literally programs things for you by implanting Rails knowledge 
      in your mind.},
  price: 1000000.00,
  location: 'The Moon',
  city_id:City.find_by(name: 'Toronto').id,
  subcategory_id: Subcategory.find_by(name: 'Books').id
  )
# . . .

Post.create!(title: 'Used Macbook',
  body: 
    %{Meant for a good HackerYou student.},
  price: 300.00,
  location: 'Ottawa',
  city_id:City.find_by(name: 'Toronto').id,
  subcategory_id: Subcategory.find_by(name: 'Computer').id
)