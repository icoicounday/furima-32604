class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  
  with_options presence: true do
    validates :name, presence: true
    validates :text presence: true
    validates :category_id
    validates :condition_id
    validates :pay_id, { with: /\A{1,7}[0-9\d]\z/ }
    validates :area_id
    validates :day_id
    validates :price, format: { with: /\A[0-9\d]\z/ }
  end
end
