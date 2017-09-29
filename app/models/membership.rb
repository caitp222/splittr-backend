class Membership < ApplicationRecord
  belongs_to :group
  belongs_to :user
  has_many :expenses
  has_many :payments, foreign_key: :payer_id

end
