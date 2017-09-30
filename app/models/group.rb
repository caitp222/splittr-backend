class Group < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :memberships
  has_many :members, through: :memberships, source: :user
  has_many :expenses, through: :memberships

  validates :group_name, presence: true

  def member_count
    self.members.length
  end

  def expenses_total
    self.expenses.sum(:amount)
  end

  def member_split
    self.expenses_total / self.member_count
  end
end
