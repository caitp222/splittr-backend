class Group < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :memberships
  has_many :members, through: :memberships, source: :user
  has_many :expenses, through: :memberships

  validates :group_name, presence: true

  # calculation methods
  def member_count
    self.members.length
  end

  def expenses_total
    self.expenses.sum(:amount)
  end

  def member_split
    self.expenses_total / self.member_count
  end

  # json object rendering methods
  def json_data
    members = self.members.map do |member|
      if member == nil
        binding.pry
      else
      member.group_json_data(self.id)
    end
    end
    { group: self, members: members, member_split: self.member_split.round(2), total_spend: self.expenses_total.round(2)}
  end
end
