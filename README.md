# テーブル設計

## users テーブル
| Column                 | Type       | Options                    |
| ---------------------- | ---------- | -------------------------- |
| email                  | string     | null: false, unique: true  |
| encrypted_password     | string     | null: false                |
| family_name            | string     | null: false                |
| first_name             | string     | null: false                |
| family_name_kana       | string     | null: false                |
| first_name_kana        | string     | null: false                |
### Association
has_one: user
has_many :rooms, through: :room_users
has_many :room_users
has_many :messages

## profiles テーブル
| Column                 | Type       | Options                    |
| ---------------------- | ---------- | -------------------------- |
| nickname               | string     | null: false                |
| introduction           | text       | null: false                |
| birthday               | date       |                            |
| prefecture_id          | integer    | null: false                |
### Association
belongs_to: user

## rooms テーブル
| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |
### Association
has_many :users, through: :room_users
has_many :room_users
has_many :messages

## room_users テーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |
### Association
- belongs_to :room
- belongs_to :user
