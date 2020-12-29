class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         with_options presence: true do
           validates :name

           with_options format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ } do
            validates :first_name
            validates :last_name
          end

          with_options format: { with: /\A[ァ-ン]+\z/ } do
            validates :first_name_kana
            validates :last_name_kana
          end
          
         validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/ }
         end
end