FactoryGirl.define do
  factory :dog do |d|
    d.sex 'male'
    #d.titles  'CH OF RUMANIA'
    d.titles ''
    #d.name 'FRAEL VALDERRAMA'
    d.name 'Samba y Fatiga Idilio'
    #d.birth_date '01/01/2001'
    d.birth_date '27/01/2006'
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

    factory :cahoot do
      cahoot true
    end

    factory :admin do
      admin true
    end

    after :create, &:confirm!
  end

  factory :type do |t|
    #['MONOGRÁFICA NACIONAL','CONCURSO MONOGRÁFICO NACIONAL O REGIONAL','Especial A.E.F.R.B.F.','Punto Obligatorio',
    # 'EXPOSICIÓN INTERNACIONAL','EXPOSICIÓN NACIONAL'].each do |n|
      t.name 'MONOGRÁFICA NACIONAL'
    #end
  end

  factory :exhibition do |e|
    e.name "exhibition 1"
    e.date '27/03/2014'
    e.type_id '1'
  end

  factory :award do |a|
    a.award 'BOS'
  end

  factory :result do |r|
    r.exhibition
    r.award
    r.dog
    r.status 'Pending'
  end

  factory :point do |p|
    p.year '2014'
    p.award
    p.type
    p.npoint '200'
  end

end