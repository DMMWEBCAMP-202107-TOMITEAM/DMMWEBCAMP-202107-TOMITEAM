class Client < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :adresses, dependent: :destroy

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :kana_last_name, presence: true
  validates :kana_first_name, presence: true
  validates :postal_code, presence: true, format: { with: /\A\d{7}\z/ } #郵便番号ハイフンなし7桁
  validates :address, presence: true
  validates :telephone_number, presence: true, format: { with: /\A\d{10,11}\z/ } #電話番号ハイフンなし10・11桁

  def active_for_authentication?
    super && (self.client_status == false)
  end

  def self.search_for(content)
        Client.where('last_name LIKE ?', '%'+content+'%').or(Client.where('first_name LIKE ?', '%'+content+'%'))
  end

end
