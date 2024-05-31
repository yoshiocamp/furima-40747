# テーブル設計

# usersテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| id              | integer    | null: false,                   |
| name            | string     | null: false,                   |
| email           | string     | null: false,                   |
| nickname        | string     | null: false,                   |
| password_digest | string     | null: false,                   |
| birth           | integer    | null: false,                   |

has_many :purchases
has_many :items

# purchasesテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

belongs_to :user
belongs_to :item
has_one :adress

# itemsテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| name         | string     | null: false,                   |
| description  | text       | null: false,                   |
| price        | integer    | null: false,                   |
| user         | references | null: false, foreign_key: true |
| genre        | integer    | null: false,                   |

belongs_to :user
has_one :purchase

# addressesテーブル
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

