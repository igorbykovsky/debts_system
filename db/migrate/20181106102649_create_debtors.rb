class CreateDebtors < ActiveRecord::Migration[5.2]
  def change
    create_table :debtors do |t|
      t.string :name
      t.string :group

      t.timestamps
    end
    add_foreign_key :debts, :debtors
  end
end
