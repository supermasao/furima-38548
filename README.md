# テーブル設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| nickname           | string              | null: false               |
| first_name         | string              | null: false               |
| last_name          | string              | null: false               |
| first_name(kana)   | string              | null: false               |
| last_name(kana)    | string              | null: false               |
| birth_day          | date                | null: false               |


### Association

- has_many :product
- has_many :record of purchase 


## destination table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| post_code                           | string     | null:false                     |
| prefecture                          | string     | null:false                     |
| city                                | string     | null:false                     |
| address                             | text       | null:false                     |
| building_name                       | text       | null:false                     |
| phone_number                        | string     | null:false                     |


### Association
- belongs_to :record of purchase 


## Product

| Column        | Type       | Options                        |
|-------------- |------------|--------------------------------|
| product_name  | string     | null: false                    |
| price         | string     | null: false                    |
| description   | text       | null: false                    |
| category      | string     | null: false                    |
| state         | string     | null: false                    |
| payer         | string     | null: false                    |
| destination   | string     | null: false                    |
| day_to_ship   | string     | null: false                    |

### Association

- belongs_to :user
- belongs_to :record of purchase 


## record of purchase 

| Column             | Type                | Options                        |
|--------------------|---------------------|------------------------------  |
| user               | references          | null: false, foreign_key: true |
| product            | references          | null: false, foreign_key: true |

### Association

- belongs_to : destination
- belongs_to : Product information



<!-- year,month,dayで分けるとデータがバラバラに管理されて不便 -->
<!-- 購入よりも先にまず出品を考える。一人の人がたくさん出せる -->
<!-- 購入記録でその他が記されるため、行き先の住所のみが必要 -->
<!-- | null: false, foreign_key: true | -->
<!--　どのユーザーがどの商品を買ったか -->
<!-- 他のテーブルから取得したいものはカラム情報ではなくカタマリ全て！それが外部キー&リファレンス -->
