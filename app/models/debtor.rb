class Debtor < ApplicationRecord
  has_many :debts, dependent: :destroy

  validates :name, :group, presence: true,
            length: { minimum: 3 }

  before_save {self.name.capitalize! unless name.blank?}
end
