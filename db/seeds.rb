# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all

users = User.create([{name: 'Example User', email: 'user@example.com', password: 'foobar', password_confirmation: 'foobar'},
                     {name: 'Test User', email: 'test@example.com', password: '123abc', password_confirmation: '123abc'}])