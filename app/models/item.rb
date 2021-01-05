class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  has_one_attached :name
  has_one_attached :text
  has_one_attached :category_id
  has_one_attached :condition_id
  has_one_attached :pay_id
  has_one_attached :area_id
  has_one_attached :day_id
  has_one_attached :price
  
  with_options presence: true do
    validates :name, presence: true
    validates :text, presence: true
    validates :category_id
    validates :condition_id
    validates :pay_id
    validates :area_id
    validates :day_id
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  end
end