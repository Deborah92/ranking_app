require 'spec_helper'
feature "Seed Data" do

  after(:all) { DatabaseCleaner.clean_with(:truncation) }
  scenario "The basics" do
    load Rails.root + "db/seeds.rb"
    User.where(email: "admin@example.com").first!
  end

  scenario "Types" do
    load Rails.root + "db/seeds.rb"
    Type.all.count.should eq 6
  end

  scenario "Awards" do
    load Rails.root + "db/seeds.rb"
    Award.all.count.should eq 15
  end

  scenario "Exhibitions" do
    load Rails.root + "db/seeds.rb"
    Exhibition.all.count.should eq 3
    Exhibition.where(type_id: Type.where(name: 'MONOGRÁFICA NACIONAL')).count.should eq 2
    Exhibition.where(type_id: '3').count.should eq 1
  end

  scenario "MONOGRÁFICA NACIONAL" do
    load Rails.root + "db/seeds.rb"
    Point.where(type_id: '1').count.should eq 7
  end

  scenario "CONCURSO MONOGRÁFICO NACIONAL O REGIONAL" do
    load Rails.root + "db/seeds.rb"
    Point.where(type_id: '2').count.should eq 4
  end

  scenario "Especial A.E.F.R.B.F." do
    load Rails.root + "db/seeds.rb"
    Point.where(type_id: '3').count.should eq 14
  end

  scenario "Punto Obligatorio" do
    load Rails.root + "db/seeds.rb"
    Point.where(type_id: '4').count.should eq 14
  end

  scenario "EXPOSICIÓN INTERNACIONAL" do
    load Rails.root + "db/seeds.rb"
    Point.where(type_id: '5').count.should eq 13
  end

  scenario "EXPOSICIÓN NACIONAL" do
    load Rails.root + "db/seeds.rb"
    Point.where(type_id: '6').count.should eq 14
  end

  scenario "Points" do
    load Rails.root + "db/seeds.rb"
    Point.where(year: '2014').count.should eq 66
  end

  scenario "Results" do
    load Rails.root + "db/seeds.rb"
    Result.all.count.should eq 6
    @dogs = Dog.all
    @points = Hash.new

    @dogs.each do |d|
      @results = Result.select(:award_id, :exhibition_id).where(dog_id: d.id).distinct
      @points[d.name]=0
      for t in @results do
        @awards = Result.select(:award_id).where(dog_id: d.id, exhibition_id: t).distinct
        @points[d.name] = @points[d.name]+ Point.where(award_id: t.award_id,type_id: t.exhibition.type_id, year: t.exhibition.date.year).sum(:npoint)
      end
    end
    @points =@points.sort_by{|a, b| b[0]}.reverse



    @points[0].should eq ["Fortunato Hautacuperche", 275]
    @points[2].should eq ["Samba y Fatiga Idilio", 250]
    @points[1].should eq ["Iron County I Gina", 200]

  end
end
