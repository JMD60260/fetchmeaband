# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:

#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Faker::Config.locale='fr'

pics=[
"https://images.pexels.com/photos/2884842/pexels-photo-2884842.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260",
"https://images.pexels.com/photos/2897883/pexels-photo-2897883.jpeg?cs=srgb&dl=adjusting-blur-businessman-2897883.jpg&fm=jpg",
"https://images.pexels.com/photos/2887707/pexels-photo-2887707.jpeg?cs=srgb&dl=adult-art-black-and-white-2887707.jpg&fm=jpg",
"https://images.pexels.com/photos/1319911/pexels-photo-1319911.jpeg?cs=srgb&dl=ao-dai-beautiful-beauty-1319911.jpg&fm=jpg",
"https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?cs=srgb&dl=adult-boy-casual-220453.jpg&fm=jpg"
]

instruments=[
"Guitare",
'Basse',
"Piano",
"Batterie",
"Vocal",
"Trompette"
]

genres=[
"Classique",
"Rock",
"Pop",
"RnB",
"Hip-Hop",
"Rap",
"Folk",
"Country",
"Variété"
]
6.times do 
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.first_name,
    email: Faker::Internet.email,
    age: rand(18..88),
    password: "password",
    instrument: instruments.sample,
    genre: genres.sample,
    description: Faker::Quote.famous_last_words
    )
end