class DropTableDepts < ActiveRecord::Migration[5.2]
  def up
    drop_table :depts
  end
end
