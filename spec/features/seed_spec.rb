require 'spec_helper'
feature "Seed Data" do
  scenario "The basics" do
    load Rails.root + "db/seeds.rb"
    user = User.where(email: "admin@example.com").first!
    exhibition1 = Exhibition.where(name: 'MONOGRÁFICA NACIONAL', date: '26/12/2014', type: 'MONOGRÁFICA NACIONAL').first_or_create!
    exhibition2 = Exhibition.where(name: 'CONCURSO MONOGRÁFICO NACIONAL O REGIONAL', date: '27/12/2014', type: 'CONCURSO MONOGRÁFICO NACIONAL O REGIONAL').first_or_create!
    exhibition3 = Exhibition.where(name: 'Especial A.E.F.R.B.F.', date: '28/12/2014', type: 'Especial A.E.F.R.B.F.').first_or_create!
    exhibition4 = Exhibition.where(name: 'Punto Obligatorio', date: '29/12/2014', type: 'Punto Obligatorio').first_or_create!
    exhibition5 = Exhibition.where(name: 'EXPOSICIÓN INTERNACIONAL', date: '30/12/2014', type: 'EXPOSICIÓN INTERNACIONAL').first_or_create!
    exhibition6 = Exhibition.where(name: 'EXPOSICIÓN NACIONAL', date: '31/12/2014', type: 'EXPOSICIÓN NACIONAL').first_or_create!

    ######## MONOGRÁFICO NACIONAL ##########
    Point.where(year: '2014', exhibition_id: exhibition1, award: 'MEJOR DE RAZA', npoint: '200').first_or_create!
    Point.where(year: '2014', exhibition_id: exhibition1, award: 'BOS', npoint: '150').first_or_create!
    Point.where(year: '2014', exhibition_id: exhibition1, award: 'RAPPEL CAC', npoint: '125').first_or_create!
    Point.where(year: '2014', exhibition_id: exhibition1, award: 'CAC', npoint: '100').first_or_create!
    Point.where(year: '2014', exhibition_id: exhibition1, award: 'R.CAC', npoint: '50').first_or_create!
    Point.where(year: '2014', exhibition_id: exhibition1, award: 'Mejor Joven', npoint: '50').first_or_create!
    Point.where(year: '2014', exhibition_id: exhibition1, award: 'CCJ/Exc.1 (Joven)', npoint: '30').first_or_create!


    ######## CONCURSO MONOGRÁFICO NACIONAL O REGIONAL ##########
    Point.where(year: '2014', exhibition_id: exhibition2, award: 'MEJOR DE RAZA', npoint: '150').first_or_create!
    Point.where(year: '2014', exhibition_id: exhibition2, award: 'BOS', npoint: '110').first_or_create!
    Point.where(year: '2014', exhibition_id: exhibition2, award: 'Mejor Joven', npoint: '35').first_or_create!
    Point.where(year: '2014', exhibition_id: exhibition2, award: 'CCJ/Exc.1 (Joven)', npoint: '25').first_or_create!


    ######## Especial A.E.F.R.B.F. ##########
    Point.where(year: '2014', exhibition_id: exhibition3, award: 'B.I.S.', npoint: '250').first_or_create!
    Point.where(year: '2014', exhibition_id: exhibition3, award: '2º B.I.S.', npoint: '225').first_or_create!
    Point.where(year: '2014', exhibition_id: exhibition3, award: '3º B.I.S.', npoint: '200').first_or_create!
    Point.where(year: '2014', exhibition_id: exhibition3, award: '1º GRUPO', npoint: '175').first_or_create!
    Point.where(year: '2014', exhibition_id: exhibition3, award: '2º GRUPO', npoint: '150').first_or_create!
    Point.where(year: '2014', exhibition_id: exhibition3, award: '3º GRUPO', npoint: '125').first_or_create!
    Point.where(year: '2014', exhibition_id: exhibition3, award: 'MEJOR DE RAZA', npoint: '100').first_or_create!
    Point.where(year: '2014', exhibition_id: exhibition3, award: 'CACIB', npoint: '75').first_or_create!
    Point.where(year: '2014', exhibition_id: exhibition3, award: 'R.CACIB', npoint: '35').first_or_create!
    Point.where(year: '2014', exhibition_id: exhibition3, award: 'RAPPEL CAC', npoint: '55').first_or_create!
    Point.where(year: '2014', exhibition_id: exhibition3, award: 'CAC', npoint: '50').first_or_create!
    Point.where(year: '2014', exhibition_id: exhibition3, award: 'R.CAC', npoint: '25').first_or_create!
    Point.where(year: '2014', exhibition_id: exhibition3, award: 'Mejor Joven', npoint: '23').first_or_create!
    Point.where(year: '2014', exhibition_id: exhibition3, award: 'CCJ/Exc.1 (Joven)', npoint: '15').first_or_create!

    ######## Punto Obligatorio ##########
    Point.where(year: '2014', exhibition_id: exhibition4, award: 'B.I.S.', npoint: '300').first_or_create!
    Point.where(year: '2014', exhibition_id: exhibition4, award: '2º B.I.S.', npoint: '250').first_or_create!
    Point.where(year: '2014', exhibition_id: exhibition4, award: '3º B.I.S.', npoint: '225').first_or_create!
    Point.where(year: '2014', exhibition_id: exhibition4, award: '1º GRUPO', npoint: '200').first_or_create!
    Point.where(year: '2014', exhibition_id: exhibition4, award: '2º GRUPO', npoint: '175').first_or_create!
    Point.where(year: '2014', exhibition_id: exhibition4, award: '3º GRUPO', npoint: '150').first_or_create!
    Point.where(year: '2014', exhibition_id: exhibition4, award: 'MEJOR DE RAZA', npoint: '125').first_or_create!
    Point.where(year: '2014', exhibition_id: exhibition4, award: 'CACIB', npoint: '85').first_or_create!
    Point.where(year: '2014', exhibition_id: exhibition4, award: 'R.CACIB', npoint: '40').first_or_create!
    Point.where(year: '2014', exhibition_id: exhibition4, award: 'RAPPEL CAC', npoint: '65').first_or_create!
    Point.where(year: '2014', exhibition_id: exhibition4, award: 'CAC', npoint: '60').first_or_create!
    Point.where(year: '2014', exhibition_id: exhibition4, award: 'R.CAC', npoint: '30').first_or_create!
    Point.where(year: '2014', exhibition_id: exhibition4, award: 'Mejor Joven', npoint: '28').first_or_create!
    Point.where(year: '2014', exhibition_id: exhibition4, award: 'CCJ/Exc.1 (Joven)', npoint: '20').first_or_create!

######## EXPOSICIÓN INTERNACIONAL ##########
    Point.where(year: '2014', exhibition_id: exhibition5, award: 'B.I.S.', npoint: '125').first_or_create!
    Point.where(year: '2014', exhibition_id: exhibition5, award: '2º B.I.S.', npoint: '115').first_or_create!
    Point.where(year: '2014', exhibition_id: exhibition5, award: '3º B.I.S.', npoint: '100').first_or_create!
    Point.where(year: '2014', exhibition_id: exhibition5, award: '1º GRUPO', npoint: '95').first_or_create!
    Point.where(year: '2014', exhibition_id: exhibition5, award: '2º GRUPO', npoint: '90').first_or_create!
    Point.where(year: '2014', exhibition_id: exhibition5, award: '3º GRUPO', npoint: '85').first_or_create!
    Point.where(year: '2014', exhibition_id: exhibition5, award: 'MEJOR DE RAZA', npoint: '80').first_or_create!
    Point.where(year: '2014', exhibition_id: exhibition5, award: 'CACIB', npoint: '65').first_or_create!
    Point.where(year: '2014', exhibition_id: exhibition5, award: 'R.CACIB', npoint: '10').first_or_create!
    Point.where(year: '2014', exhibition_id: exhibition5, award: 'CAC', npoint: '40').first_or_create!
    Point.where(year: '2014', exhibition_id: exhibition5, award: 'R.CAC', npoint: '20').first_or_create!
    Point.where(year: '2014', exhibition_id: exhibition5, award: 'Mejor Joven', npoint: '18').first_or_create!
    Point.where(year: '2014', exhibition_id: exhibition5, award: 'CCJ/Exc.1 (Joven)', npoint: '10').first_or_create!

######## EXPOSICIÓN NACIONAL ##########
    Point.where(year: '2014', exhibition_id: exhibition6, award: 'B.I.S.', npoint: '100').first_or_create!
    Point.where(year: '2014', exhibition_id: exhibition6, award: '2º B.I.S.', npoint: '90').first_or_create!
    Point.where(year: '2014', exhibition_id: exhibition6, award: '3º B.I.S.', npoint: '80').first_or_create!
    Point.where(year: '2014', exhibition_id: exhibition6, award: '1º GRUPO', npoint: '75').first_or_create!
    Point.where(year: '2014', exhibition_id: exhibition6, award: '2º GRUPO', npoint: '70').first_or_create!
    Point.where(year: '2014', exhibition_id: exhibition6, award: '3º GRUPO', npoint: '65').first_or_create!
    Point.where(year: '2014', exhibition_id: exhibition6, award: 'MEJOR DE RAZA', npoint: '60').first_or_create!
    Point.where(year: '2014', exhibition_id: exhibition6, award: 'CACIB', npoint: '55').first_or_create!
    Point.where(year: '2014', exhibition_id: exhibition6, award: 'R.CACIB', npoint: '8').first_or_create!
    Point.where(year: '2014', exhibition_id: exhibition6, award: 'RAPPEL CAC', npoint: '35').first_or_create!
    Point.where(year: '2014', exhibition_id: exhibition6, award: 'CAC', npoint: '30').first_or_create!
    Point.where(year: '2014', exhibition_id: exhibition6, award: 'R.CAC', npoint: '15').first_or_create!
    Point.where(year: '2014', exhibition_id: exhibition6, award: 'Mejor Joven', npoint: '15').first_or_create!
    Point.where(year: '2014', exhibition_id: exhibition6, award: 'CCJ/Exc.1 (Joven)', npoint: '15').first_or_create!

  end
end
