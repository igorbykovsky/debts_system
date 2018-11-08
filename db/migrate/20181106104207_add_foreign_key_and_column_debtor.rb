class AddForeignKeyAndColumnDebtor < ActiveRecord::Migration[5.2]
  def change
    add_reference :debts, :debtor, foreign_key: true
  end
end
