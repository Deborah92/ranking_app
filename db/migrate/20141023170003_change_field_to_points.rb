class ChangeFieldToPoints < ActiveRecord::Migration
  def change
    change_table :points do |t|
      t.change :award, :string
    end
  end
end
