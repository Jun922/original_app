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
