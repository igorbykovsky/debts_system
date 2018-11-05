class CreateDepts < ActiveRecord::Migration[5.2]
  def change
    create_table :depts do |t|
      t.integer :amount
      t.string  :description
      t.date    :deal_date

      t.timestamps
    end
  end
end
