class User < ApplicationRecord
  has_many :created_groups, foreign_key: :creator_id, class_name: "Group"
  has_many :memberships
  has_many :groups, through: :memberships
  has_many :expenses, through: :memberships

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true

  has_secure_password
end
