class Client < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :adresses, dependent: :destroy

  def active_for_authentication?
    super && (self.client_status == false)
  end
  
  def self.search_for(content)
        Client.where('last_name LIKE ?', '%'+content+'%').or(Client.where('first_name LIKE ?', '%'+content+'%'))
  end

end
