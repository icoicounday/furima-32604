FactoryBot.define do
  factory :user do
    name {Faker::Name.name}
    email {Faker::Internet.free_email}
    password {'1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation {password}
    first_name {"田中"}
    last_name {"田中"}
    first_name_kana {"カタカナ"}
    last_name_kana {"カタカナ"}
    birthday{"1111-11-11"}
  end
end