class Debt < ApplicationRecord
  belongs_to :debtor

  validates :sum, presence: true
end
