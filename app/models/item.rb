class Item < ApplicationRecord
  
  eunm sale_status:{
    "販売中": 0,
    "売り切れ": 1,
  }
  
  has_many :cart_items,dependent: :destroy
  has_many :order_items,dependent: :destroy
  belouns_to :genre

end
