# テーブル設計

## users テーブル
| Column                 | Type       | Options                    |
| ---------------------- | ---------- | -------------------------- |
| nickname               | string     | null: false                |
| email                  | string     | null: false, unique: true  |
| encrypted_password     | string     | null: false                |
| introduction           | text       | null: false                |
| birthday               | date       |                            |
| prefecture_id          | integer    | null: false                |
### Association
has_many :chats, through: :chat_users
has_many :chat_users
has_many :individual_messages

## chats テーブル
| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |
### Association
has_many :users, through: :chat_users
has_many :chat_users
has_many :individual_messages

## chat_users テーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| chat   | references | null: false, foreign_key: true |
### Association
- belongs_to :chat
- belongs_to :user

## individual_messages テーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| chat    | references | null: false, foreign_key: true |
### Association
- belongs_to :chat
- belongs_to :user

## rooms テーブル
| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| category_id | integer    | null: false                    |

### Association

## many_messages テーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |
### Association
