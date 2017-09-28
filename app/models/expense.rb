class Expense < ApplicationRecord
  validates :amount, :vendor, presence: true
end
