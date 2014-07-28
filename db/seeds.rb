# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user1 = User.create(email: 'user1@example.com',
                    password: 'password',
                    password_confirmation: 'password',
                    confirmed_at: DateTime.now)

user2 = User.create(email: 'user2@example.com',
                    password: 'password',
                    password_confirmation: 'password',
                    confirmed_at: DateTime.now)

Dog.create(name: 'Samba y Fatiga Idilio',
           sex: 'male', birth_date: '27/01/2006',
           user_id: user1.id)
Dog.create(name: 'Fortunato Hautacuperche',
           sex: 'male', birth_date: '15/05/2008',
           user_id: user2.id)