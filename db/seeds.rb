# frozen_string_literal: true

Faker::Config.locale = 'fr'

instruments = %w[
  Guitare
  Basse
  Piano
  Batterie
  Vocal
  Trompette
]

genres = %w[
  Classique
  Rock
  Pop
  RnB
  Hip-Hop
  Rap
  Folk
  Country
  Variété
]

levels = %w[
  Débutant
  Amateur
  Professionnel
]

12.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.first_name,
    email: Faker::Internet.email,
    age: rand(18..88),
    password: 'password',
    instrument: instruments.sample,
    genre: genres.sample,
    description: Faker::Quote.famous_last_words,
    level: levels.sample
  )
end
