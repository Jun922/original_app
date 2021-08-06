# テーブル設計

## users テーブル
| Column                 | Type       | Options                    |
| ---------------------- | ---------- | -------------------------- |
| nickname               | string     | null: false                |
| email                  | string     | null: false, unique: true  |
| encrypted_password     | string     | null: false                |
| birthday               | date       |                            |
### Association
has_many :chats, through: :chat_users
has_many :chat_users
has_many :individual_messages
has_many :rooms, through: :room_users
has_many :room_users
has_many :many_messages


＊掲示板

## room_users テーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |
### Association
belongs_to :room
belongs_to :user

## rooms テーブル
| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| category_id | integer    | null: false                    |
### Association
has_many :users, through: :room_users
has_many :room_users
has_many :many_messages

## many_messages テーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |
### Association
belongs_to :chat
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