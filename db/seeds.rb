# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Post.delete_all
Post.create!(title: 'Rideshare from Toronto to Ottawa',
  body: 
    %{Offering a Rideshare from Toronto to Ottawa. Must have GOOD
      hygiene (i.e. Don't smell bad). Preferrably students. Must shower
      prior to trip. Driver has the right to refuse entry to those who do 
      not shower.},
  price: 30.00,
  location: 'Ottawa')
# . . .
Post.create!(title: 'Selling Best Ruby on Rails Textbook',
  body: 
    %{The book we have is currently good, but this textbook will blow your 
      mind. Literally programs things for you by implanting Rails knowledge 
      in your mind.},
  price: 1000000.00,
  location: 'The Moon')
# . . .

Post.create!(title: 'Used Macbook',
  body: 
    %{Meant for a good HackerYou student.},
  price: 300.00,
  location: 'Ottawa')

City.allowed_types.each do |x|
  City.create!(name: "#{x}")
end