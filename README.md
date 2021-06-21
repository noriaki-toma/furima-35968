# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| nickname           | string | null: false              |
| email              | string | null: false unique: true |
| encrypted_password | string | null: false              |
| family_name        | string | null: false              |
| first_name         | string | null: false              |
| family_name_kana   | string | null: false              |
| first_name_kana    | string | null: false              |
| birthday           | date   | null: false              |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| name            | string     | null: false                    |
| text            | text       | null: false                    |
| category_id     | integer    | null: false                    |
| condition_id    | integer    | null: false                    |
| postage_id      | integer    | null: false                    |
| prefecture_id   | integer    | null: false                    |
| shipping_day_id | integer    | null: false                    |
| price           | integer    | null: false                    |


### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false,                   |


### Association

- has_one :address
- belongs_to :item
- belongs_to :user

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| item          | references | null: false, foreign_key: true |
| postal        | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address1      | string     | null: false                    |
| address2      | string     |                                |
| telephone     | string     | null: false                    |

### Association

- belongs_to :order
