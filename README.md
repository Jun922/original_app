<h2 align="center">original-app1</h2>

## 🌐 App URL

### **https://original-app1.herokuapp.com/**  

![index](https://i.gyazo.com/3c4a9eef28b33868e039a6fba68e4845.jpg)

## 📝 制作背景
![index](https://i.gyazo.com/39620ec75eaaf8ff8c80ee0be9b61f3f.png)

## 📖 テーブル設計

#### users テーブル
| Column       | Type       | Options                    |
| -------------| ---------- | -------------------------- |
| name         | string     | null: false                |
| email        | string     | null: false, unique: true  |
| password     | string     | null: false                |
| birthday     | date       |                            |
| introduction | text       |                            |
- Association
  - has_many :room2s  
  - has_many :posts  
  - has_many :room_users  
  - has_many :rooms, through: :room_users  
  - has_many :messages  
  - has_many :relationships[following, follower]  



#### room2s テーブル
| Column | Type       | Options                        |
| -------| ---------- | ------------------------------ |
| name   | string     | null: false                    |
| user   | references | null: false, foreign_key: true |
- Association
  - has_many :posts  
  - belongs_to :user  

#### posts テーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room2   | references | null: false, foreign_key: true |
- Association
  - belongs_to :room2  
  - belongs_to :user  
  - has_one_attached :image  



#### relationships テーブル
| Column        | Type    | Options |
| ------------- | ------- | ------- |
| follower_id   | integer |         |
| followed_id   | integer |         |
- Association
  - belongs_to :user  



#### rooms テーブル
| Column | Type       | Options                        |
| -------| ---------- | ------------------------------ |
| name   | string     | null: false                    |
- Association
  - has_many :room_user  
  - has_many :users, through: :room_users  
  - has_many :messages  

#### room_users テーブル
| Column | Type       | Options                         |
| -------| ---------- | ------------------------------- |
| room    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |
- Association
  - belongs_to :user  
  - belongs_to :room  

#### messages テーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |
- Association
  - belongs_to :room  
  - belongs_to :user  
  - has_one_attached :image  
