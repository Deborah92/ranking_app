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


['MONOGRÁFICA NACIONAL','CONCURSO MONOGRÁFICO NACIONAL O REGIONAL','Especial A.E.F.R.B.F.','Punto Obligatorio',
 'EXPOSICIÓN INTERNACIONAL','EXPOSICIÓN NACIONAL'].each do |t|
  Type.where(name: t).first_or_create!
end

['B.I.S.','2º B.I.S.','3º B.I.S.','1º GRUPO','2ºGRUPO','3º GRUPO','MEJOR DE RAZA','BOS','CACIB','R.CACIB','RAPPEL CAC',
 'CAC','R.CAC','Mejor Joven','CCJ/Exc.1 (Joven)'].each do |a|
  Award.where(award: a).first_or_create!
end

[['Exhibition 1', '26/12/2014', '1'],['Exhibition 2', '27/12/2014', '3'],
 ['Exhibition 3', '28/12/2014', '1']].each do |n, d, t|
  Exhibition.where(name: n, date: d, type_id: t).first_or_create
end

[['1','7','200'],['1','8','150'], ###### MONOGRÁFICA NACIONAL ######
  ['1','11','125'], ['1','12','100'],
  ['1','13','50'], ['1','14','50'],
  ['1','15','30'],
  ['2','7','150'],['2','8','110'], ###### CONCURSO MONOGRÁFICO NACIONAL O REGIONAL ######
  ['2','14','35'], ['2','15','25'],
  ['3','1','250'], ['3','2','225'], ###### Especial A.E.F.R.B.F. ######
  ['3','3','200'], ['3','4','175'],
  ['3','5','150'], ['3','6','125'],
  ['3','7','100'], ['3','9','75'],
  ['3','10','35'], ['3','11','55'],
  ['3','12','50'], ['3','13','25'],
  ['3','14','23'], ['3','15','15'],
  ['4','1','300'], ['4','2','250'], ###### Punto Obligatorio ######
  ['4','3','225'], ['4','4','200'],
  ['4','5','175'], ['4','6','150'],
  ['4','7','125'], ['4','9','85'],
  ['4','10','40'], ['4','11','65'],
  ['4','12','60'], ['4','13','30'],
  ['4','14','28'], ['4','15','20'],
  ['5','1','125'], ['5','2','115'], ###### EXPOSICIÓN INTERNACIONAL ######
  ['5','3','100'], ['5','4','95'],
  ['5','5','90'], ['5','6','85'],
  ['5','7','80'], ['5','9','65'],
  ['5','10','10'], ['5','12','40'],
  ['5','13','20'], ['5','14','18'],
  ['5','15','10'],
  ['6','1','100'], ['6','2','90'], ###### EXPOSICIÓN NACIONAL ######
  ['6','3','80'], ['6','4','75'],
  ['6','5','70'], ['6','6','65'],
  ['6','7','60'], ['6','9','55'],
  ['6','10','8'], ['6','11','35'],
  ['6','12','30'], ['6','13','15'],
  ['6','14','15'], ['6','15','5']].each do |t, a, p|
  Point.create(year: '2014', type_id: t, award_id: a, npoint: p)
end
