class ChangeSumType < ActiveRecord::Migration[5.2]
  def change
    change_column :debts, :sum, :float
  end
end
