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

### Association

- has_many :items
- has_many :comments
- has_many :payments

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

## comments テーブル

| Column  | Type       | Options                        |
| content | text       |                                |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## payments テーブル

| Column      | Type    | Options     |
| card-number | integer | null: false |
| cvc         | integer | null: false |
| holder-name | string  | null: false |

### Association 

belongs_to :user


