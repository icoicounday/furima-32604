FactoryBot.define do

  factory :order_address do
    post_number { '123-4567' }
    area_id { 2 }
    city { '東久留米市' }
    house_number { '1-1' }
    building_name { '東京ハイツ' }
    phone_number {'09011111111'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end