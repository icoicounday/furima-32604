class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_number, :area_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id


  with_options presence: true do
    validates :post_number, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :area_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :house_number
    validates :city
    validates :phone_number
    validates :user_id
    validates :item_id
  end

  def save ここをかく
    # オーダーの情報を保存・ここ修正
    order.create(item: item, user: user)
    # 住所の情報を保存
    Address.create(post_number: post_number, area_id: area_id, house_number: house_number, city: city, building_name: building_name, phone_number: phone_number, user_id: user.id)
  end
end