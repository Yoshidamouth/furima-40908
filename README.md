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
| name               | text       | null: false |
| explain            | text       | null: false |
| category           | string     | null: false |
| situation          | string     | null: false |
| shipping_area      | string     | null: false |
| shipping_days      | string     | null: false |
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

## addresses テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| postcode           | string | null: false |
| prefectures        | string | null: false |
| municipalities     | string | null: false |
| street_address     | string | null: false |
| building_name      | string |             |
| phone_number       | string | null: false |
| order              | references | null: false, foreign_key: true |

### Association

- belongs_to :order