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

| Column                | Type     | Options     |
| first-name            | string   | null: false |
| last-name             | string   | null: false |
| first-name-reading    | string   | null: false |
| last-name-reading     | string   | null: false |
| email                 | string   | null: false |
| nickname              | string   | null: false |
| password              | string   | null: false |
| password-confirmation | string   | null: false |
| birth-year            | integer  | null: false |
| birth-month           | integer  | null: false |
| birth-day             | integer  | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :payments
- has_one :address

## items テーブル

| Column      | Type       | Options                        |
| image       | string     | null: false                    |
| name        | string     | null: false                    |
| explanation | text       | null: false                    |
| price       | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association

- has_many :comments
- belongs_to :user
- has_one :item

## comments テーブル

| Column  | Type       | Options                        |
| content | text       |                                |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## address テーブル

| Column        | Type       | Options                        |
| postcode      | integer    | null: false                    |
| city          | string     | null: false                    |
| house         | number     | null: false                    |
| building-name | string     |                                |
| phone-number  | integer    | null: false                    |
| user_id       | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## purchases テーブル

| Column  | Type       | Options                        |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association テーブル

- has_many :users
- belong_to :item



