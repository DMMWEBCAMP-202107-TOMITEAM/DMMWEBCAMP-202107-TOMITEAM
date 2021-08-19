class Item < ApplicationRecord

  attachment :image

  has_many :cart_items, dependent: :destroy
  has_many :order_items, dependent: :destroy
  belongs_to :genre

end
