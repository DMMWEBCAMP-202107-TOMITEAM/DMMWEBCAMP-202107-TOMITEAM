class Adress < ApplicationRecord

  belongs_to :client
  
  
  validates :postal_code, presence: true, format: { with: /\A\d{7}\z/ }
  validates :address, presence: true
  validates :name, presence: true
  
end
