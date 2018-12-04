require 'rails_helper'

RSpec.describe Debt, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  it "should correct sum of debts" do

    debt1 = Debt.new(sum: 10, deal_date: 2018-11-11, description: "ssss")
    debt2 = Debt.new(sum: 20, deal_date: 2018-11-20, description: "aaaa")

    debtor = Debtor.new(name: "Azer", group: "Friend")
    debtor.debts << debt1
    debtor.debts << debt2

    expect(debtor.calc_total).to eq 30
  end

end
