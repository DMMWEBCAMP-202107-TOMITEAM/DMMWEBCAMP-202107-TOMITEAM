class OrderItem < ApplicationRecord

  belongs_to :order
  belongs_to :item

  enum making_status: [:not_startable, :wait, :producing, :complete]

end
