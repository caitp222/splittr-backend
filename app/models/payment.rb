class Payment < ApplicationRecord
  belongs_to :payer, class_name: "Membership"

  validates :amount, presence: true
end
