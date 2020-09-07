# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column    | Type   | Options     |
| ------    | ------ | ----------- |
| name      | string | null: false |
| email     | string | null: false |
| password  | string | null: false |

###  Association
- has_many :products
- has_one :profiles

## profiles テーブル

| Column          | Type      | Option                         |
| --------------- | --------- | ------------------------------ |
| last_name       | string    | null: false                    |
| first_name      | string    | null: false                    |
| last_name_kana  | string    | null: false                    |
| first_name_kana | string    | null: false                    |
| birth_year      | date      | null: false                    |
| birth_month     | date      | null: false                    |
| birth_day       | date      | null: false                    |
| users_id        | reference | null: false, foreign_key: true |

###  Association
- belongs_to :user

## products テーブル

| Column           | Type      | Option                         |
| ---------------- | --------- | ------------------------------ |
| item_image       | string    | null: false                    |
| item_name        | string    | null: false                    |
| item_description | text      | null: false                    |
| category_id      | integer   | null: false                    |
| item_status_id   | integer   | null: false                    |
| postage_id       | integer   | null: false                    |
| region_id        | integer   | null: false                    |
| shipping_date_id | integer   | null: false                    |
| price            | integer   | null: false                    |
| user_id          | reference | null: false, foreign_key: true |

###  Association
- belongs_to :user
- has_one :addresses

## addresses テーブル

| Column        | Type      | Option                         |
| ------------- | --------- | ------------------------------ |
| postcode      | string    | null: false                    |
| prefecture_id | integer   | null: false                    |
| city          | string    | null: false                    |
| block         | string    | null: false                    |
| building      | string    |                                |
| phone_number  | integer   | null: false                    |
| items_id      | reference | null: false, foreign_key: true |

###  Association
- belongs_to :product