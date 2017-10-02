class Expense < ApplicationRecord
  belongs_to :membership
  has_one :user, through: :membership
  has_one :group, through: :membership

  validates :amount, :vendor, presence: true

  # json object rendering methods
  def json_data
    { id: self.id, membership_id: self.membership_id, amount: self.amount.round(2), paid_by: self.user.full_name, description: self.description, vendor: self.vendor, group_id: self.group.id }
  end

  def group_json_data
    { vendor: self.vendor, amount: self.amount.round(2), group_id: self.group.id, id: self.id }
  end
end
