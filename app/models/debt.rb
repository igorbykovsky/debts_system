class Debt < ApplicationRecord
  belongs_to :debtor

  validates :sum, :deal_date, :description, presence: true
  validates :description, length: { minimum: 4 }
end
