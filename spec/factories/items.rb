FactoryBot.define do

  factory :item do
    name {Faker::Name.name}
    text {"1234"}
    category_id {2}
    condition_id {2}
    pay_id {2}
    area_id {2}
    day_id {2}
    price{1111111}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end