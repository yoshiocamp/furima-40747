# テーブル設計

# usersテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| id           | integer    | null: false,                   |
| name         | string     | null: false,                   |
| email        | string     | null: false,                   |
| created_at   | string     | null: false,                   |
| update_at    | string     | null: false,                   |

has_many :purchases
has_many :items

# purchasesテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| id           | integer    | null: false,                   |
| user_id      | string     | null: false, foreign_key: true |
| item_id      | string     | null: false, foreign_key: true |
| created_at   | string     | null: false,                   |
| update_at    | string     | null: false,                   |

belongs_to :user
belongs_to :item

# itemsテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| id           | integer    | null: false,                   |
| name         | string     | null: false,                   |
| description  | text       | null: false,                   |
| price        | string     | null: false,                   |
| user_id      | string     | null: false, foreign_key: true |
| created_at   | string     | null: false,                   |
| update_at    | string     | null: false,                   |

belongs_to :user
belongs_to :purchase