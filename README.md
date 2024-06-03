# テーブル設計

# usersテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| first_name         | string     | null: false,                   |
| first_name_kana    | string     | null: false,                   |
| last_name          | string     | null: false,                   |
| last_name_kana     | string     | null: false,                   |
| email              | string     | null: false,  unique: true     |
| nickname           | string     | null: false,                   |
| encrypted_password | string     | null: false,                   |
| birth              | date       | null: false,                   |

has_many :details
has_many :items

# detailsテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

belongs_to :item
has_one :address


# itemsテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false,                   |
| description   | text       | null: false,                   |
| price         | integer    | null: false,                   |
| user          | references | null: false, foreign_key: true |
| category_id   | integer    | null: false,                   |
| status_id     | integer    | null: false,                   |
| fee_id        | integer    | null: false,                   |
| prefecture_id | integer    | null: false,                   |
| delivery_id   | integer    | null: false,                   |


belongs_to :user
has_one :detail

# addressesテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | string     | null: false,                   |
| prefecture_id      | string     | null: false,                   |
| city               | string     | null: false,                   |
| addresses          | string     | null: false,                   |
| building           | string     |                  |
| phone_number       | string     | null: false,                   |
| user               | references | null: false, foreign_key: true |
| detail            | references | null: false, foreign_key: true |

belongs_to :detail