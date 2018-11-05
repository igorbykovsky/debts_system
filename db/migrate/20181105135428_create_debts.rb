class CreateDebts < ActiveRecord::Migration[5.2]
  def change
    create_table :debts do |t|
      t.integer :sum
      t.string :description
      t.date :deal_date

      t.timestamps
    end
  end
end
