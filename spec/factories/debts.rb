FactoryBot.define do
  factory :debt do
    debtor

    sum { 10 }
    description { "good deal" }
    deal_date { 1.day.ago }
  end
end