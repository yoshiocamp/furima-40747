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

has_many :purchases
has_many :items

# purchasesテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

belongs_to :user
belongs_to :item
has_one :address

# itemsテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| name         | string     | null: false,                   |
| description  | text       | null: false,                   |
| price        | integer    | null: false,                   |
| user         | references | null: false, foreign_key: true |
| genre_id     | integer    | null: false,                   |
| profit       | integer    | null: false,                   |

belongs_to :user
has_one :purchas

# addressesテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false,                   |
| house_number       | string     | null: false,                   |
| unit               | string     | null: false,                   |
| city               | string     | null: false,                   |
| zip                | string     | null: false,                   |
| phone_number       | string     | null: false,                   |
| user               | references | null: false, foreign_key: true |
| purchas            | references | null: false, foreign_key: true |

belongs_to :item