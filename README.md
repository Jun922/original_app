<h2 align="center">original-app1</h2>

## 🌐 App URL

### **https://original-app1.herokuapp.com/**  

![index](https://i.gyazo.com/3c4a9eef28b33868e039a6fba68e4845.jpg)

## 📝 制作背景
価値観や人間性は周囲5人の平均と言われています。
しかし、社会人になり学生時代と比べ、新しい出会いや価値観との出会いが少なくなったと感じました。
そこで、誰とでも意見や熱い思いを交換できる場を作ることで、周りや自分の常識に固執、または囚われることなく、常に自分をアップデートしようと考え、アプリ制作に取り組み始めました。

## 📖 テーブル設計

#### users テーブル
| Column       | Type       | Options                    |
| -------------| ---------- | -------------------------- |
| name         | string     | null: false                |
| email        | string     | null: false, unique: true  |
| password     | string     | null: false                |
| birthday     | date       |                            |
| introduction | text       |                            |
##### Association
-has_many :room2s　　
-has_many :posts　　
-has_many :room_users　　
-has_many :rooms, through: :room_users　　
-has_many :messages　　
-has_many :relationships[following, follower]　　


### 掲示板
#### room2s テーブル
| Column | Type       | Options                        |
| -------| ---------- | ------------------------------ |
| name   | string     | null: false                    |
| user   | references | null: false, foreign_key: true |
##### Association
-has_many :posts　　
-belongs_to :user　　

#### posts テーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room2   | references | null: false, foreign_key: true |
##### Association
-belongs_to :room2　　
-belongs_to :user　　
-has_one_attached :image　　


### フォロー機能
#### relationships テーブル
| Column        | Type    | Options |
| ------------- | ------- | ------- |
| follower_id   | integer |         |
| followed_id   | integer |         |
### Association
-belongs_to :user　　


### 個人チャット
#### rooms テーブル
| Column | Type       | Options                        |
| -------| ---------- | ------------------------------ |
| name   | string     | null: false                    |
##### Association
-has_many :room_user　　
-has_many :users, through: :room_users　　
-has_many :messages　　

#### room_users テーブル
| Column | Type       | Options                         |
| -------| ---------- | ------------------------------- |
| room    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |
##### Association
-belongs_to :user　　
-belongs_to :room　　

#### messages テーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |
##### Association
-belongs_to :room　　
-belongs_to :user　　
-has_one_attached :image　　
