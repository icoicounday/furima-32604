class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  
  with_options presence: true do
    validates :category_id
    validates :area_id
    validates :condition_id
    validates :pay_id, format: { with: /\A{1,7}[0-9\d]+\z/ }
    validates :day_id
  end
end
