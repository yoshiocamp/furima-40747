# テーブル設計

# usersテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| name         | string     | null: false,                   |
| email        | string     | null: false,                   |
 

has_many :purchases
has_many :items

# purchasesテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| id           | integer    | null: false,                   |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |
| image        | string     | null: false,                   |

belongs_to :user
belongs_to :item

# itemsテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| id           | integer    | null: false,                   |
| name         | string     | null: false,                   |
| description  | text       | null: false,                   |
| price        | string     | null: false,                   |
| user         | references | null: false, foreign_key: true |
| category     | string     | null: false,                   |
| sales-status | text       | null: false,                   |

belongs_to :user
belongs_to :purchase

# addressテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false,                   |
| address_line1      | string     | null: false,                   |
| address_line2      | string     | null: false,                   |
| city               | string     | null: false,                   |
| state              | string     | null: false,                   |
| country            | string     | null: false,                   |
| zip                | string     | null: false,                   |
| phone_number       | string     | null: false,                   |
| fee_status         | string     | null: false,                   |
| prefecture         | string     | null: false,                   |
| scheduled_delivery | string     | null: false,                   |