class Expense < ApplicationRecord
  belongs_to :membership
  has_one :user, through: :membership
  has_one :group, through: :membership

  validates :amount, :vendor, presence: true

  # json object rendering methods
  def json_data
    { id: self.id, membership_id: self.membership_id, amount: self.amount, paid_by: self.user.full_name, description: self.description, vendor: self.vendor }
  end

  def group_json_data
    {vendor: self.vendor, amount: self.amount, date: self.created_at}
  end
end
