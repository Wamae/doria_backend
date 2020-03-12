# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
IncidentType.create!([{ name: 'Theft' }, { name: 'Rape' }, { name: 'Domestic Violence' }])
Admin.create!(email: 'admin@doria.com', password: 'doria123', password_confirmation: 'doria123')
User.create!(email: 'user@doria.com', phone: '0716690166', first_name: 'Jane', last_name: 'Doe',
             password: 'doria123', password_confirmation: 'doria123')