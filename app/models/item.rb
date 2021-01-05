class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  
  with_options presence: true do
    validates :name
    validates :text
    validates :category_id
    validates :condition_id
    validates :pay_id, format: { with: /\A{1,7}[0-9\d]+\z/ }
    validates :area_id
    validates :day_id
    validates :price
  end
end
