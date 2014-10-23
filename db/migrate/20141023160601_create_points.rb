class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.integer :year
      t.integer :exhibition_id
      t.string :award
      t.integer :npoint
    end
  end
end
