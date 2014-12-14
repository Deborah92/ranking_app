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
                    confirmed_at: DateTime.now,
                    cahoot: 'true',
                    image: File.open(File.join(Rails.root, "/public/uploads/user/image/1/usuaria2.png")))

user2 = User.create(email: 'user2@example.com',
                    password: 'password',
                    password_confirmation: 'password',
                    confirmed_at: DateTime.now,
                    image: File.open(File.join(Rails.root, "/public/uploads/user/image/2/usuario.png")))

user3 = User.create(email: 'admin@example.com',
                    password: 'password',
                    password_confirmation: 'password',
                    confirmed_at: DateTime.now,
                    cahoot: 'true',
                    admin: 'true',
                    image: File.open(File.join(Rails.root, "/public/uploads/user/image/3/usuaria.png")))



dog1 = Dog.create(name: 'Samba y Fatiga Idilio', sex: 'male', birth_date: '2006-01-27',
           titles: "JR CH LUXEMBURGO, CH LUXEMBURGO, CH PORTUGAL, CH BULGARIA, CH MONTENEGRO, CH MACEDONIA, CH BALCANES",
           user_id: user1.id, image: File.open(File.join(Rails.root, "/public/uploads/dog/image/1/samba.jpg")))

dog2 = Dog.create(name: 'Fortunato Hautacuperche',
           sex: 'male', birth_date: '2008-05-15',
           titles: "CH AZERBAIJAN, CH BULGARIA, CH CHIPRE, CH COSTA RICA, CH FILIPINAS, CH GEORGIA, CH MACEDONIA,
           CH MOLDAVIA, CH MONTENEGRO, CH SAN MARINO",
           user_id: user2.id, image: File.open(File.join(Rails.root, "/public/uploads/dog/image/2/fortunato.jpg")))

dog3 = Dog.create(name: 'Iron County I Gina',
           sex: 'female', birth_date: '2009-10-10',
           titles: "CH.JOVEN ESPAÑA, CH PORTUGAL, GRAN CH PORTUGAL, CH FRANCIA, CH LUXEMBURGO",
           user_id: user3.id, image: File.open(File.join(Rails.root, "/public/uploads/dog/image/3/iron.jpg")))


['MONOGRÁFICA NACIONAL','CONCURSO MONOGRÁFICO NACIONAL O REGIONAL','Especial A.E.F.R.B.F.','Punto Obligatorio',
 'EXPOSICIÓN INTERNACIONAL','EXPOSICIÓN NACIONAL'].each do |t|
  Type.where(name: t).first_or_create!
end

['B.I.S.','2º B.I.S.','3º B.I.S.','1º GRUPO','2ºGRUPO','3º GRUPO','MEJOR DE RAZA','BOS','CACIB','R.CACIB','RAPPEL CAC',
 'CAC','R.CAC','MEJOR JOVEN','CCJ/EXC.1 (JOVEN)'].each do |a|
  Award.where(award: a).first_or_create!
end

[['V Monográfica Nacional de la A.E.F.R.B.F.', '2014-01-13', '1'],
 ['Exposición Internacional de granada 2012 especial A.E.F.R.B.F.', '2014-06-25', '3'],
 ['I Monográfica Nacional Bulldog Francés Cantabria 2014', '2014-10-05', '1']].each do |n, d, t|
  Exhibition.where(name: n, date: d, type_id: t).first_or_create!
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
[['1', '7', '1'],['2', '9', '2'],
 ['3', '14', '1'],['3', '7', '2'],
 ['3','8','3'],['2','12','3']].each do |e, a, d|
  Result.create(exhibition_id: e, award_id: a, dog_id: d, status: 'Validated')
end

[['2','1','1'],['1','12','3']].each do |e, a, d|
  Result.create(exhibition_id: e, award_id: a, dog_id: d, status: 'Pending')
end
