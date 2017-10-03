class User < ApplicationRecord
  has_many :created_groups, foreign_key: :creator_id, class_name: "Group"
  has_many :memberships
  has_many :groups, through: :memberships
  has_many :expenses, through: :memberships

  has_secure_password

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true

  # virtual attributes
  def full_name
    first_name + " " + last_name
  end

  # debt calculation methods
  def total_group_spend(group_id)
    group = Group.find_by(id: group_id)
    user_expenses = group.expenses.select{|expense| expense.user == self}
    total = user_expenses.inject(0){|sum, expense| sum + expense.amount}
    total.round(2)
  end

  def owes_group?(group_id)
    group = Group.find_by(id: group_id)
    self.total_group_spend(group.id) < group.member_split
  end

  def owed_by_group?(group_id)
    group = Group.find_by(id: group_id)
    self.total_group_spend(group.id) > group.member_split
  end

  def amount_owed_by_group(group_id)
    group = Group.find_by(id: group_id)
    if self.owed_by_group?(group_id)
      total = self.total_group_spend(group_id) - group.member_split
      total.round(2)
    else
      return 0
    end
  end

  def amount_owes_group(group_id)
    group = Group.find_by(id: group_id)
    if self.owes_group?(group_id)
      total = group.member_split - self.total_group_spend(group_id)
      total.round(2)
    else
      return 0
    end
  end

  # json object rendering methods
  def json_data
    { user: self, user_groups: self.groups }
  end

  def group_json_data(group_id)
    expenses = self.expenses.select {|expense| expense.group.id == group_id}
    user_expenses = expenses.map! do |expense|
      expense.group_json_data
    end
    if self.owes_group?(group_id)
      { id: self.id, full_name: self.full_name, total_spend: self.total_group_spend(group_id), expenses: expenses, owes: self.owes_group?(group_id), amount_user_owes: self.amount_owes_group(group_id).round(2) }
    else
      { id: self.id, full_name: self.full_name, total_spend: self.total_group_spend(group_id), expenses: expenses, owes: self.owes_group?(group_id), amount_user_is_owed: self.amount_owed_by_group(group_id).round(2) }
    end
  end

end
