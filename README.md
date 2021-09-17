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
has_many :room2s
has_many :posts
has_many :room_users
has_many :rooms, through: :room_users
has_many :messages
has_many :relationships[following, follower]


＊掲示板
## room2s テーブル
| Column | Type       | Options                        |
| -------| ---------- | ------------------------------ |
| name   | string     | null: false                    |
| user   | references | null: false, foreign_key: true |
### Association
has_many :posts
belongs_to :user

## posts テーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room2   | references | null: false, foreign_key: true |
### Association
belongs_to :room2
belongs_to :user
has_one_attached :image


*フォロー機能
## relationships テーブル
| Column        | Type    | Options |
| ------------- | ------- | ------- |
| follower_id   | integer |         |
| followed_id   | integer |         |
### Association
belongs_to :user


*個人チャット

## rooms テーブル
| Column | Type       | Options                        |
| -------| ---------- | ------------------------------ |
| name   | string     | null: false                    |
### Association
has_many :room_user
has_many :users, through: :room_users
has_many :messages

## room_users テーブル
| Column | Type       | Options                         |
| -------| ---------- | ------------------------------- |
| room    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |
### Association
belongs_to :user
belongs_to :room

## messages テーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |
### Association
belongs_to :room
belongs_to :user
has_one_attached :image