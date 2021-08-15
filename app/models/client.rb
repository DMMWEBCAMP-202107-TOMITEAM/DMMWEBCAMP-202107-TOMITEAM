class Client < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  enum user_status:{
    "既存": 0,
    "退会": 1,
  } 
  
  has_many :cart_items,dependent: :destroy
  has_many :orders,dependent: :destroy
  has_many :adresses,dependent: :destroy
  
end
