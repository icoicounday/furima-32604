FactoryBot.define do

  factory :item do
    name {Faker::Name.name}
    text {"商品説明"}
    category_id =  {}
    condition_id {"新品、未使用"}
    pay_id {"着払い（購入者負担）"}
    area_id {"北海道"}
    day_id {"1日~2日で発送"}
    price{11111111}
    association :user 
  end
end