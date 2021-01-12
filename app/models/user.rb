class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :orders
         
    with_options presence: true do
      validates :name
      validates :birthday
    end
  
    with_options format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/ } do
      validates :first_name
      validates :last_name
    end
  
    with_options format: { with: /\A[ァ-ン]+\z/ } do
      validates :first_name_kana
      validates :last_name_kana
    end
  
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/ }
end