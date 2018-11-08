class Debtor < ApplicationRecord
  has_many :debts, dependent: :destroy

  validates :name, :group, presence: true,
            length: { minimum: 3 }

end
