class CartItem < ApplicationRecord
  belouns_to :item
  belouns_to :client
end
