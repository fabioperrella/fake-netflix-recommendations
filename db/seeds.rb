# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: 'john', preferences: ['horror', 'comedy'], email: 'john@aa.com')
User.create(name: 'maria', preferences: ['drama', 'comedy'], email: 'maria@aa.com')
User.create(name: 'alex', preferences: ['scifi', 'horror', 'commedy'], email: 'alex@aa.com')

Item.create(
  name: 'Anita',
  preferences: ['teenager', 'music'],
  secondary_preferences: ['drama']
)
Item.create(
  name: 'Breaking Bad',
  preferences: ['violence', 'drugs'],
  secondary_preferences: ['drama']
)
Item.create(
  name: 'The good place',
  preferences: ['comedy'],
  secondary_preferences: ['drama']
)
Item.create(
  name: 'The walking dead',
  preferences: ['horror', 'violence', 'commedy'],
  secondary_preferences: ['drama']
)
Item.create(
  name: 'Stranger Things',
  preferences: ['thriller', 'scifi'],
  secondary_preferences: ['teenager']
)