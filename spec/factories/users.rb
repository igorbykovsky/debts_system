FactoryBot.define do
  factory :user do
    sequence(:email) { |i| "rspec#{i}@test.com" }
    password { "123456" }
  end
end
