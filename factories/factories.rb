FactoryGirl.define do
  factory :dog do |d|
    d.sex 'male'
    d.titles  'CH OF RUMANIA'
    d.name 'FRAEL VALDERRAMA'
    d.birth_date '01/01/2001'
    d.user
  end

  # factory :user do |u|
  #   u.email 'user@example.com'
  #   u.encrypted_password  'password'
  #
  # end

  factory :user do |u|
    u.sequence(:email) { |n| "user#{n}@example.com" }
    u.password 'password'
    u.password_confirmation 'password'

    factory :admin do
      admin true
    end

    after :create, &:confirm!
  end

  factory :type do |t|
    ['MONOGRÁFICA NACIONAL','CONCURSO MONOGRÁFICO NACIONAL O REGIONAL','Especial A.E.F.R.B.F.','Punto Obligatorio',
     'EXPOSICIÓN INTERNACIONAL','EXPOSICIÓN NACIONAL'].each do |n|
      t.name n
    end
  end

  factory :exhibition do |e|
    e.name 'exhibition 1'
    e.date '27/03/2015'
    e.type
  end

end