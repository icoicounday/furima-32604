class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to :category
  belongs_to :condition
  belongs_to :pay
  belongs_to :area
  belongs_to :day
  has_one :order
  
  with_options presence: true do
    validates :name
    validates :text
    validates :image
  end

  with_options numericality: { other_than: 1 }do
    validates :category_id
    validates :condition_id
    validates :pay_id
    validates :area_id
    validates :day_id
  end

  validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
end