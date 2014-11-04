class AddFieldImageToDogs < ActiveRecord::Migration
  def change
    add_column :dogs, :image, :string
  end
end
