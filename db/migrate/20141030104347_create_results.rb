class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :exhibition_id
      t.integer :award_id
      t.integer :dog_id
      t.string :status

      t.timestamps
    end
  end
end
