class User < ApplicationRecord
  has_many :created_groups, foreign_key: :creator_id, class_name: "Group"
  has_many :memberships
  has_many :groups, through: :memberships
  has_many :expenses, through: :memberships

  has_secure_password

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
end
