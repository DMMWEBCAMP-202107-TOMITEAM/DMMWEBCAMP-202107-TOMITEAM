class OrderItem < ApplicationRecord
  belouns_to :order
  belouns_to :item
end
