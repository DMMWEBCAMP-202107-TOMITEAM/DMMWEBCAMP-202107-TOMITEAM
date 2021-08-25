class Order < ApplicationRecord
  enum payment_method:{
    "クレジットカード": 0,
    "銀行振込": 1
  }

  enum order_status: [:wait_for_payment, :confirm_payment, :producing, :ready_to_ship, :complete_ship]

  has_many :order_items, dependent: :destroy
  belongs_to :client

end
