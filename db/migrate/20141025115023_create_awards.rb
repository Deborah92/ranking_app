class CreateAwards < ActiveRecord::Migration
  def change
    create_table :awards do |t|
      t.string :award
    end
  end
end
