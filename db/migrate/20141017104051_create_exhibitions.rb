class CreateExhibitions < ActiveRecord::Migration
  def change
    create_table :exhibitions do |t|
      t.string :name
      t.date :date
      t.string :type

      t.timestamps
    end
  end
end
