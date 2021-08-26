class Item < ApplicationRecord


  attachment :image


  has_many :cart_items, dependent: :destroy
  has_many :order_items, dependent: :destroy
  belongs_to :genre
  
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  # validates :sale_status, presence: true
  

def self.search_for(content)
        Item.where('name LIKE ?', '%'+content+'%').or(Item.where(genre_id: content))
end

end
