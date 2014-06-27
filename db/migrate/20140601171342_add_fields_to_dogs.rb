class AddFieldsToDogs < ActiveRecord::Migration
  def change
    add_column :dogs, :titles, :string
    add_column :dogs, :sex, :string
    add_column :dogs, :birth_date, :date
  end
end
