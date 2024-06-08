# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| lastname           | string | null: false |
| firstname          | string | null: false |
| lastname_kana      | string | null: false |
| firstname_kana     | string | null: false |
| dateofbirth        | date   | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :orders

## items テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| name               | string     | null: false |
| explain            | text       | null: false |
| category_id        | integer    | null: false |
| situation_id       | integer    | null: false |
| delivery_charge_id | integer    | null: false |
| prefecture_id      | integer    | null: false |
| shipping_day_id    | integer    | null: false |
| price              | integer    | null: false |
| user               | references | null: false, foreign_key: true |

### Association

- has_many :comments
- belongs_to :user
- has_one :order

## comments テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| content            | text       | null: false |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## orders テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| postcode           | string  | null: false |
| prefecture_id      | integer | null: false |
| municipalities     | string  | null: false |
| street_address     | string  | null: false |
| building_name      | string  |             |
| phone_number       | string  | null: false |
| order              | references | null: false, foreign_key: true |

### Association

- belongs_to :order