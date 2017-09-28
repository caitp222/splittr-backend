class Group < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :memberships
  has_many :members, through: :memberships, source: :user
  has_many :expenses, through: :memberships

  validates :group_name, presence: true
end
