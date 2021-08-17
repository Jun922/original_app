# テーブル設計

## users テーブル
| Column       | Type       | Options                    |
| -------------| ---------- | -------------------------- |
| name         | string     | null: false                |
| email        | string     | null: false, unique: true  |
| password     | string     | null: false                |
| birthday     | date       |                            |
| introduction | text       |                            |
### Association
has_many :rooms
has_many :posts

＊掲示板

## rooms テーブル
| Column | Type       | Options                        |
| -------| ---------- | ------------------------------ |
| name   | string     | null: false                    |
| user   | references | null: false, foreign_key: true |
### Association
has_many :posts
belongs_to :user

## posts テーブル ×10(各職種)
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association
belongs_to :category
belongs_to :user
has_one_attached :image


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