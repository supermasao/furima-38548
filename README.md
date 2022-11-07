# テーブル設計

## users 

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| nickname           | string              | null: false               |
| first_name         | string              | null: false               |
| last_name          | string              | null: false               |
| first_name_kana    | string              | null: false               |
| last_name_kana     | string              | null: false               |
| birth_day          | date                | null: false               |


### Association

- has_many :products
- has_many :purchases 


## destinations

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| post_code                           | string     | null:false                     |
| prefecture                          | string     | null:false                     |
| city                                | string     | null:false                     |
| address                             | string     | null:false                     |
| building_name                       | text       |                                |
| phone_number                        | string     | null:false                     |
| purchase                            | references | foreign_key: true              | 


### Association
- belongs_to : purchase 


## Products

| Column        | Type       | Options                        |
|-------------- |------------|--------------------------------|
| product_name  | string     | null: false                    |
| price         | integer    | null: false                    |
| description   | text       | null: false                    |
| category      | string     | null: false                    |
| state         | string     | null: false                    |
| payer         | string     | null: false                    |
| destination   | string     | null: false                    |
| day_to_ship   | string     | null: false                    |
| user          | references | foreign_key: true              |

### Association

- belongs_to :user
- has_one :purchase


## purchases 

| Column             | Type                | Options                        |
|--------------------|---------------------|------------------------------  |
| user               | references          | null: false, foreign_key: true |
| product            | references          | null: false, foreign_key: true |

### Association

- belongs_to : destination
- belongs_to : Product
- belongs_to : users



<!-- 以下学習用メモ -->
<!-- year,month,dayで分けるとデータがバラバラに管理されて不便 -->
<!-- 購入よりも先にまず出品を考える。一人の人がたくさん出せる -->
<!-- 購入記録でその他が記されるため、行き先の住所のみが必要 -->
<!-- | null: false, foreign_key: true | -->
<!--どのユーザーがどの商品を買ったか -->
<!-- 他のテーブルから取得したいものはカラム情報ではなくカタマリ全て！それが外部キー&リファレンス -->

<!-- productsにuser突っ込む -->
<!-- itemテーブルってなに？ -->
<!--アクティブハッシュの謎 -->
