class Expense < ApplicationRecord
  belongs_to :membership
  has_one :user, through: :membership
  has_one :group, through: :membership

  validates :amount, :vendor, presence: true

  # json object rendering methods
  def group_show_object
    {vendor: self.vendor, amount: self.amount, date: self.created_at}
  end
end
