class ChangeFieldsToExhibitions < ActiveRecord::Migration
  def change
    remove_column :exhibitions, :type
    add_column :exhibitions, :type_id, :integer
  end
end
