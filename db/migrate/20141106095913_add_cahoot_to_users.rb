class AddCahootToUsers < ActiveRecord::Migration
  def change
    add_column :users, :cahoot, :boolean, default: false
  end
end
