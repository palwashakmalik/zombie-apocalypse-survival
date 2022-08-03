# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(admin: true, email: 'palwasha@gmail.com', name: 'palwasha', age: 18, gender: 'female')
User.create(admin: false, email: 'palwashamalik@gmail.com', name: 'palwashamalik', age: 23, gender: 'female', infected: false,
            location_history: { 'latitude' => '2', 'longitude' => '54' }, items_attributes: [{item_name: 'water', points: 12}])
User.create(admin: false, email: 'nimra@gmail.com', name: 'nimra', age: 18, gender: 'female', infected: false,
            location_history: { 'latitude' => '65', 'longitude' => '445' }, items_attributes: [{item_name: 'wheat', points: 24}])
