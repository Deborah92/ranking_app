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

user3 = User.create(email: 'admin@example.com',
                    password: 'password',
                    password_confirmation: 'password',
                    confirmed_at: DateTime.now,
                    admin: 'true')

Dog.create(name: 'Samba y Fatiga Idilio',
           sex: 'male', birth_date: '27/01/2006',
           user_id: user1.id)
Dog.create(name: 'Fortunato Hautacuperche',
           sex: 'male', birth_date: '15/05/2008',
           user_id: user2.id)

exhibition1 = Exhibition.create(name: 'MONOGRÁFICA NACIONAL', date: '26/12/2014', type: 'MONOGRÁFICA NACIONAL')
exhibition2 = Exhibition.create(name: 'CONCURSO MONOGRÁFICO NACIONAL O REGIONAL', date: '27/12/2014', type: 'CONCURSO MONOGRÁFICO NACIONAL O REGIONAL')
exhibition3 = Exhibition.create(name: 'Especial A.E.F.R.B.F.', date: '28/12/2014', type: 'Especial A.E.F.R.B.F.')
exhibition4 = Exhibition.create(name: 'Punto Obligatorio', date: '29/12/2014', type: 'Punto Obligatorio')
exhibition5 = Exhibition.create(name: 'EXPOSICIÓN INTERNACIONAL', date: '30/12/2014', type: 'EXPOSICIÓN INTERNACIONAL')
exhibition6 = Exhibition.create(name: 'EXPOSICIÓN NACIONAL', date: '31/12/2014', type: 'EXPOSICIÓN NACIONAL')


######## MONOGRÁFICO NACIONAL ##########
Point.create(year: '2014', exhibition_id: exhibition1.id, award: 'MEJOR DE RAZA', npoint: '200')
Point.create(year: '2014', exhibition_id: exhibition1.id, award: 'BOS', npoint: '150')
Point.create(year: '2014', exhibition_id: exhibition1.id, award: 'RAPPEL CAC', npoint: '125')
Point.create(year: '2014', exhibition_id: exhibition1.id, award: 'CAC', npoint: '100')
Point.create(year: '2014', exhibition_id: exhibition1.id, award: 'R.CAC', npoint: '50')
Point.create(year: '2014', exhibition_id: exhibition1.id, award: 'Mejor Joven', npoint: '50')
Point.create(year: '2014', exhibition_id: exhibition1.id, award: 'CCJ/Exc.1 (Joven)', npoint: '30')

######## CONCURSO MONOGRÁFICO NACIONAL O REGIONAL ##########
Point.create(year: '2014', exhibition_id: exhibition2.id, award: 'MEJOR DE RAZA', npoint: '150')
Point.create(year: '2014', exhibition_id: exhibition2.id, award: 'BOS', npoint: '110')
Point.create(year: '2014', exhibition_id: exhibition2.id, award: 'Mejor Joven', npoint: '35')
Point.create(year: '2014', exhibition_id: exhibition2.id, award: 'CCJ/Exc.1 (Joven)', npoint: '25')

######## Especial A.E.F.R.B.F. ##########
Point.create(year: '2014', exhibition_id: exhibition3.id, award: 'B.I.S.', npoint: '250')
Point.create(year: '2014', exhibition_id: exhibition3.id, award: '2º B.I.S.', npoint: '225')
Point.create(year: '2014', exhibition_id: exhibition3.id, award: '3º B.I.S.', npoint: '200')
Point.create(year: '2014', exhibition_id: exhibition3.id, award: '1º GRUPO', npoint: '175')
Point.create(year: '2014', exhibition_id: exhibition3.id, award: '2º GRUPO', npoint: '150')
Point.create(year: '2014', exhibition_id: exhibition3.id, award: '3º GRUPO', npoint: '125')
Point.create(year: '2014', exhibition_id: exhibition3.id, award: 'MEJOR DE RAZA', npoint: '100')
Point.create(year: '2014', exhibition_id: exhibition3.id, award: 'CACIB', npoint: '75')
Point.create(year: '2014', exhibition_id: exhibition3.id, award: 'R.CACIB', npoint: '35')
Point.create(year: '2014', exhibition_id: exhibition3.id, award: 'RAPPEL CAC', npoint: '55')
Point.create(year: '2014', exhibition_id: exhibition3.id, award: 'CAC', npoint: '50')
Point.create(year: '2014', exhibition_id: exhibition3.id, award: 'R.CAC', npoint: '25')
Point.create(year: '2014', exhibition_id: exhibition3.id, award: 'Mejor Joven', npoint: '23')
Point.create(year: '2014', exhibition_id: exhibition3.id, award: 'CCJ/Exc.1 (Joven)', npoint: '15')

######## Punto Obligatorio ##########
Point.create(year: '2014', exhibition_id: exhibition4.id, award: 'B.I.S.', npoint: '300')
Point.create(year: '2014', exhibition_id: exhibition4.id, award: '2º B.I.S.', npoint: '250')
Point.create(year: '2014', exhibition_id: exhibition4.id, award: '3º B.I.S.', npoint: '225')
Point.create(year: '2014', exhibition_id: exhibition4.id, award: '1º GRUPO', npoint: '200')
Point.create(year: '2014', exhibition_id: exhibition4.id, award: '2º GRUPO', npoint: '175')
Point.create(year: '2014', exhibition_id: exhibition4.id, award: '3º GRUPO', npoint: '150')
Point.create(year: '2014', exhibition_id: exhibition4.id, award: 'MEJOR DE RAZA', npoint: '125')
Point.create(year: '2014', exhibition_id: exhibition4.id, award: 'CACIB', npoint: '85')
Point.create(year: '2014', exhibition_id: exhibition4.id, award: 'R.CACIB', npoint: '40')
Point.create(year: '2014', exhibition_id: exhibition4.id, award: 'RAPPEL CAC', npoint: '65')
Point.create(year: '2014', exhibition_id: exhibition4.id, award: 'CAC', npoint: '60')
Point.create(year: '2014', exhibition_id: exhibition4.id, award: 'R.CAC', npoint: '30')
Point.create(year: '2014', exhibition_id: exhibition4.id, award: 'Mejor Joven', npoint: '28')
Point.create(year: '2014', exhibition_id: exhibition4.id, award: 'CCJ/Exc.1 (Joven)', npoint: '20')

######## EXPOSICIÓN INTERNACIONAL ##########
Point.create(year: '2014', exhibition_id: exhibition5.id, award: 'B.I.S.', npoint: '125')
Point.create(year: '2014', exhibition_id: exhibition5.id, award: '2º B.I.S.', npoint: '115')
Point.create(year: '2014', exhibition_id: exhibition5.id, award: '3º B.I.S.', npoint: '100')
Point.create(year: '2014', exhibition_id: exhibition5.id, award: '1º GRUPO', npoint: '95')
Point.create(year: '2014', exhibition_id: exhibition5.id, award: '2º GRUPO', npoint: '90')
Point.create(year: '2014', exhibition_id: exhibition5.id, award: '3º GRUPO', npoint: '85')
Point.create(year: '2014', exhibition_id: exhibition5.id, award: 'MEJOR DE RAZA', npoint: '80')
Point.create(year: '2014', exhibition_id: exhibition5.id, award: 'CACIB', npoint: '65')
Point.create(year: '2014', exhibition_id: exhibition5.id, award: 'R.CACIB', npoint: '10')
Point.create(year: '2014', exhibition_id: exhibition5.id, award: 'CAC', npoint: '40')
Point.create(year: '2014', exhibition_id: exhibition5.id, award: 'R.CAC', npoint: '20')
Point.create(year: '2014', exhibition_id: exhibition5.id, award: 'Mejor Joven', npoint: '18')
Point.create(year: '2014', exhibition_id: exhibition5.id, award: 'CCJ/Exc.1 (Joven)', npoint: '10')

######## EXPOSICIÓN NACIONAL ##########
Point.create(year: '2014', exhibition_id: exhibition6.id, award: 'B.I.S.', npoint: '100')
Point.create(year: '2014', exhibition_id: exhibition6.id, award: '2º B.I.S.', npoint: '90')
Point.create(year: '2014', exhibition_id: exhibition6.id, award: '3º B.I.S.', npoint: '80')
Point.create(year: '2014', exhibition_id: exhibition6.id, award: '1º GRUPO', npoint: '75')
Point.create(year: '2014', exhibition_id: exhibition6.id, award: '2º GRUPO', npoint: '70')
Point.create(year: '2014', exhibition_id: exhibition6.id, award: '3º GRUPO', npoint: '65')
Point.create(year: '2014', exhibition_id: exhibition6.id, award: 'MEJOR DE RAZA', npoint: '60')
Point.create(year: '2014', exhibition_id: exhibition6.id, award: 'CACIB', npoint: '55')
Point.create(year: '2014', exhibition_id: exhibition6.id, award: 'R.CACIB', npoint: '8')
Point.create(year: '2014', exhibition_id: exhibition6.id, award: 'RAPPEL CAC', npoint: '35')
Point.create(year: '2014', exhibition_id: exhibition6.id, award: 'CAC', npoint: '30')
Point.create(year: '2014', exhibition_id: exhibition6.id, award: 'R.CAC', npoint: '15')
Point.create(year: '2014', exhibition_id: exhibition6.id, award: 'Mejor Joven', npoint: '15')
Point.create(year: '2014', exhibition_id: exhibition6.id, award: 'CCJ/Exc.1 (Joven)', npoint: '5')
