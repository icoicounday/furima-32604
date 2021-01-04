class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image



  belongs_to :category
  belongs_to :area
  belongs_to :condition
  belongs_to :pay
  belongs_to :day

end
