FactoryBot.define do

  factory :item do
    name {Faker::Name.name}
    text {"1234"}
    category_id {"1234"}
    condition_id {"1234"}
    pay_id {"1234"}
    area_id {"1234"}
    day_id {"1234"}
    price{11111111}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end