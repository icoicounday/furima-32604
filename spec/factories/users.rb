FactoryBot.define do
  factory :user do
    name {Faker::Name.name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    first_name {"田中"}
    last_name {"田中"}
    first_name_kana {"カタカナ"}
    last_name_kana {"カタカナ"}
    birthday{11111111}
  end
end