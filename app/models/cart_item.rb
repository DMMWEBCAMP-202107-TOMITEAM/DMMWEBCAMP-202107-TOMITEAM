class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :client


  # def sum_of_price
  #   item.taxin_price * amount
  # end

end
