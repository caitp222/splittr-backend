class Expense < ApplicationRecord
  belongs_to :membership
  has_one :user, through: :membership
  has_one :group, through: :membership

  validates :amount, :vendor, presence: true

end
