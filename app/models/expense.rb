class Expense < ApplicationRecord
  belongs_to :membership

  validates :amount, :vendor, presence: true
end
