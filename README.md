# テーブル設計

## users テーブル

| Column             | Type   | Options                 |
| ------------------ | ------ | ----------------------- |
| name               | string | null: false             |
| email              | string | null: false,unique: true|
| encrypted_password | string | null: false             |
| last_name          | string | null: false             |
| first_name         | string | null: false             |
| last_name_kana     | string | null: false             |
| first_name_kana    | string | null: false             |
| birthday           | date   | null: false             |

## Association
- has_many：items
- has_many:orders
- has_one:address


## items テーブル

| Column      | Type       | Options                     |
| ----------- | ---------- | ----------------------------|
| name        | string     | null: false                 |
| text        | text       | null: false                 |
| category_id | integer    | null: false                 |
| condition_id| integer    | null: false                 |
| pay_id      | integer    | null: false                 |
| area_id     | integer    | null: false                 |
| day_id      | integer    | null: false                 |
| price       | integer    | null: false                 |
| user_id     | references | null:false,foreign_key:true |

## Association
- belongs_to：user
- has_one:order
- has_one:address


## order テーブル

| Column    | Type       | Options                     |
| --------- | ---------- | ----------------------------|
| item      | references | null:false,foreign_key:true |
| user_id   | references | null:false,foreign_key:true |

## Association
- has_one：users
- has_one:addresses
- belongs_to：item


## addresses テーブル

| Column         | Type       | Options                     |
| -------------- | ---------- | ----------------------------|
| post_number    | string     | null: false                 |
| prefecture_id  | integer    | null: false                 |
| city           | string     | null: false                 |
| house_number   | string     | null: false                 |
| building_name  | string     |                             |
| phone_number   | string     | null: false                 |
| order_id       | references | null:false,foreign_key:true |

## Association
- belongs_to：user
- has_one:order
- has_one:items