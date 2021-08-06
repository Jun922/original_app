# テーブル設計

## users テーブル
| Column                 | Type       | Options                    |
| ---------------------- | ---------- | -------------------------- |
| nickname               | string     | null: false                |
| email                  | string     | null: false, unique: true  |
| encrypted_password     | string     | null: false                |
| birthday               | date       |                            |
### Association
has_many :categories
has_many :many_messages
has_many :room_users
has_many :rooms, through: :room_users
has_many :individual_messages

＊掲示板

## categories テーブル
| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| content     | string     | null: false                    |
| user        | references | null: false, foreign_key: true |
| category    | references | null: false, foreign_key: true |
### Association
has_many :many_messages
belongs_to :user

## messages テーブル ×10(各職種)
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
### Association
belongs_to :category
belongs_to :user


＊個人チャット

## chat_users テーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| chat   | references | null: false, foreign_key: true |
### Association
belongs_to :chat
belongs_to :user

## chats テーブル
| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |
### Association
has_many :users, through: :chat_users
has_many :chat_users
has_many :individual_messages

## individual_messages テーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| chat    | references | null: false, foreign_key: true |
### Association
belongs_to :chat
belongs_to :user