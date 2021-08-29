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
has_many :room2s
has_many :chats
has_many :relationships[following, follower]


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
belongs_to :room
belongs_to :user
has_one_attached :image


*フォロー機能
## relationships テーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| follower_id   | string     | null: false                    |
| followed_id   | references | null: false, foreign_key: true |
### Association
belongs_to :user


*個人チャット

## room2s テーブル
| Column | Type       | Options                        |
| -------| ---------- | ------------------------------ |
| name   | string     | null: false                    |
| user   | references | null: false, foreign_key: true |
### Association
has_many :chats
belongs_to :user

## chats テーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
### Association
belongs_to :room2
belongs_to :user
has_one_attached :image