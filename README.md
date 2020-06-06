# ChatSpace DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false, unique:true|
|password|string|null: false|
### Association
- has_many :groups through: users_groups
_ has_many :messages


## groupsテーブル
|Column|Type|Options|
|------|----|-------|
|group_name|text||
|user_id|integer|null:false, foreign_key: true|
### Association
- has_many :users through: users_groups
_ has_many :messages


## messageテーブル
|Column|Type|Options|
|------|----|-------|
|text|text||
|image|text||
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :group
- belongs_to :user

## users_groupsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :group
>>>>>>> Stashed changes
