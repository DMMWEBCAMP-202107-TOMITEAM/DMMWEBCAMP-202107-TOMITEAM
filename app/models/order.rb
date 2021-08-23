class Order < ApplicationRecord
  enum payment_method:{
    "クレジットカード": 0,
    "銀行振込": 1
  }

  enum order_status:{
    "入金待ち": 0,
    "入金確認": 1,
    "製作中": 2,
    "発送準備中": 3,
    "発送済み": 4
  }

  has_many :order_items, dependent: :destroy
  belongs_to :client

end
