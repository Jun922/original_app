<h2 align="center">original-app1</h2>

## ð App URL

### **https://original-app1.herokuapp.com/**  

![index](https://i.gyazo.com/3c4a9eef28b33868e039a6fba68e4845.jpg)

## ð å¶ä½èæ¯
ä¾¡å¤è¦³ãäººéæ§ã¯å¨å²5äººã®å¹³åã¨è¨ããã¦ãã¾ããããããç¤¾ä¼äººã«ãªãå­¦çæä»£ã¨æ¯ã¹ãæ°ããåºä¼ããä¾¡å¤è¦³ã¨ã®åºä¼ããå°ãªããªã£ãã¨æãã¾ããã  
ããã§ãèª°ã¨ã§ãæè¦ãç±ãæããäº¤æã§ããå ´ãä½ããã¨ã§ãå¨ããèªåã®å¸¸è­ã«åºå·ãã¾ãã¯åããããã¨ãªããå¸¸ã«èªåãã¢ãããã¼ããããã¨èããã¢ããªå¶ä½ã«åãçµã¿å§ãã¾ããã

## ð¤ å·¥å¤«ããç¹
æ²ç¤ºæ¿ã§æ°ã«ãªã£ãã¦ã¼ã¶ã¼ã¨ããè¦ªç¦ãæ·±ãããããã«DMæ©è½ãå®è£ãã¾ããã  
ã¾ããä»ã¦ã¼ã¶ã¼ã®æå ±ãç·¨éã§ããªãããã«ã³ã¼ãã£ã³ã°ãªã©ãã»ã­ã¥ãªãã£é¢ã«ãæ°ãéãã³ã¼ãã£ã³ã°ãã¾ããã

## ð ãã¼ãã«è¨­è¨
- ID/Pass
  - id: admin  
  - pass:0922 

#### users ãã¼ãã«
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



#### room2s ãã¼ãã«
| Column | Type       | Options                        |
| -------| ---------- | ------------------------------ |
| name   | string     | null: false                    |
| user   | references | null: false, foreign_key: true |
- Association
  - has_many :posts  
  - belongs_to :user  

#### posts ãã¼ãã«
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room2   | references | null: false, foreign_key: true |
- Association
  - belongs_to :room2  
  - belongs_to :user  
  - has_one_attached :image  



#### relationships ãã¼ãã«
| Column        | Type    | Options |
| ------------- | ------- | ------- |
| follower_id   | integer |         |
| followed_id   | integer |         |
- Association
  - belongs_to :user  



#### rooms ãã¼ãã«
| Column | Type       | Options                        |
| -------| ---------- | ------------------------------ |
| name   | string     | null: false                    |
- Association
  - has_many :room_user  
  - has_many :users, through: :room_users  
  - has_many :messages  

#### room_users ãã¼ãã«
| Column | Type       | Options                         |
| -------| ---------- | ------------------------------- |
| room    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |
- Association
  - belongs_to :user  
  - belongs_to :room  

#### messages ãã¼ãã«
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |
- Association
  - belongs_to :room  
  - belongs_to :user  
  - has_one_attached :image  
