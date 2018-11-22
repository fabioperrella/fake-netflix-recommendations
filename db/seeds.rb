# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: 'john', preferences: ['horror', 'comedy'])
User.create(name: 'maria', preferences: ['drama', 'comedy'])
User.create(name: 'alex', preferences: ['scifi', 'horror', 'commedy'])

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