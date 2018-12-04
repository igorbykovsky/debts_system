class Debtor < ApplicationRecord
  has_many :debts, dependent: :destroy
  belongs_to :user

  validates :name, :group, presence: true,
            length: { minimum: 3 }

  before_save {self.name.capitalize! unless name.blank?}

  def calc_total
    debts.inject(0) { |res, debt| res + debt.sum}
  end
end
