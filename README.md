# テーブル設計

## users テーブル

| Column    | Type   | Options     |
| --------- | ------ | ----------- |
| name      | string | null: false |
| email     | string | null: false |
| password  | string | null: false |


## items テーブル

| Column   | Type       | Options     |
| -------- | ---------- | ----------- |
| name     | string     | null: false |
| text     | text       |             |
| category | integer    |             |
| condition| references |             |
| pay      | references |             |
| area     | references |             |
| days     | integer    |             |
| price    | references |             |
| seller   | references |             |
| buyer    | references |             |


## images テーブル

| Column    | Type       | Options                          |
| --------- | ---------- | ---------------------------------|
| img       | text       | null: false                      |
| item_id   | references | null:false,foreign_key:true      |


## category テーブル

| Column    | Type       | Options     |
| --------- | ---------- | ------------|
| name      | string     | null: false |


## comments テーブル

| Column    | Type       | Options                          |
| --------- | ---------- | ---------------------------------|
| comment   | text       | null: false                      |
| user      | references | null:false,foreign_key:true      |
| item      | references | null:false,foreign_key:true      |


## addresses テーブル

| Column         | Type       | Options                          |
| -------------- | ---------- | ---------------------------------|
| last_name      | string     | null: false                      |
| first_name     | string     | null: false                      |
| last_name_kana | string     | null: false                      |
| first_name_kana| string     | null: false                      |
| post_number    | integer    | null: false                      |
| prefecture_code| integer    | null: false                      |
| city           | string     | null: false                      |
| house_number   | string     | null: false                      |
| building_name  | string     |                                  |
| phone_number   | integer    |                                  |
| user_id        | references | null:false,foreign_key:true      |


## profile テーブル

| Column         | Type       | Options                          |
| -------------- | ---------- | ---------------------------------|
| last_name      | string     | null: false                      |
| first_name     | string     | null: false                      |
| last_name_kana | string     | null: false                      |
| first_name_kana| string     | null: false                      |
| birthday       | string     | null: false                      |
| user_id        | references | null:false,foreign_key:true      |


##  credit_card テーブル

| Column         | Type       | Options                          |
| -------------- | ---------- | ---------------------------------|
| user_id        | integer    | null:false,foreign_key:true      |
| customer_id    | string     | null:false,foreign_key:true      |
| card_id        | string     | null:false,foreign_key:true      |