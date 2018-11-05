class Debt < ApplicationRecord
  validates :sum, presence: true
end
