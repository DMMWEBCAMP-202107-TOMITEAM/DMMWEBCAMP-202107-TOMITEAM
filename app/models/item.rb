class Item < ApplicationRecord

  enum sale_status:{
    "販売中": 0,
    "売り切れ": 1
  }

  has_many :cart_items, dependent: :destroy
  has_many :order_items, dependent: :destroy
  belongs_to :genre

end
