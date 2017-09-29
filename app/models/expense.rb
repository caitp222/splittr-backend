class Expense < ApplicationRecord
  belongs_to :membership

  validates :amount, :vendor, presence: true

  def group
    self.membership.group
  end

  def user
    self.membership.user
  end
end
