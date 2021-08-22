class Item < ApplicationRecord


  attachment :image


  has_many :cart_items, dependent: :destroy
  has_many :order_items, dependent: :destroy
  belongs_to :genre

def self.search_for(content)
        Item.where('name LIKE ?', '%'+content+'%').or(Item.where(genre_id: content))
end

end
