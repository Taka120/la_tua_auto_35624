# README

## アプリ名
La tua Auto
ラ トゥア オート  (イタリア語で"あなたの車"の意味)

## アプリ概要
自家用車の点検時期をリマインドするアプリ

## 作成背景(意図)

## DEMO
現在作成中

## 実装予定の内容
・ユーザー管理機能
・点検時期、車検時期お知らせ(リマインド)機能
・整備工場の地図表示、検索機能
・整備工場の評価、コメント機能
・コラム表示機能


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
