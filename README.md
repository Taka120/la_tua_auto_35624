# README

## usersテーブル

| Column             | Type     | Options                   |
| ------------------ | -------- | ------------------------- |
| nickname           | string   | null: false               |
| email              | string   | null: false, unique: true |
| encrypted_password | string   | null: false               |
| birthday           | datetime | null: false               |
| postal_number      | string   |                           |
| address            | string   |                           |
| telephone_number   | string   |                           |
| last_name          | string   |                           |
| first_name         | string   |                           |

### Association
has_many :cars
has_many :comments
has_many :notifications

## carsテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| car_name        | string     | null: false                    |
| inspection_date | date       | null: false                    |
| color           | string     |                                |
| car_nickname    | string     |                                |
| car_status      | string     |                                |

### Association
belongs_to :user
has_one :notification

## notificationsテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| car             | references | null: false, foreign_key: true |

### Association
belongs_to :user
has_one :car

## commentsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| recommendation_id  | integer    | null: false                    |
| cleanliness_id     | integer    | null: false                    |
| kindness_id        | integer    | null: false                    |
| female_clerk_id    | integer    | null: false                    |
| kids_room_id       | integer    | null: false                    |
| powder_room_id     | integer    | null: false                    |
| comment            | text       |                                |

### Association
belongs_to :user
