class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :client

  validates :amount, numericality:{ only_integer: true }, presence: true
  # def sum_of_price
  #   item.taxin_price * amount
  # end

end
