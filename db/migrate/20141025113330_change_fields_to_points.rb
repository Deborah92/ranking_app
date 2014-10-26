class ChangeFieldsToPoints < ActiveRecord::Migration
  def change
    rename_column :points, :exhibition_id, :type_id
    remove_column :points, :award
    add_column  :points, :award_id, :integer
  end
end
