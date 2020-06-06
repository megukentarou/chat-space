<<<<<<< Updated upstream
=======
# ChatSpace DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false, unique:true|
|password|string|null: false|
### Association
- has_many :groups
_ has_many :messages, through: users_messages


## groupsテーブル
|Column|Type|Options|
|------|----|-------|
|group_name|text||
|user_id|integer|null:false, foreign_key: true|
### Association
- belongs_to :user
_ has_many :messages


## messageテーブル
|Column|Type|Options|
|------|----|-------|
|text|text||
|image|text||
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|
### Association
- has_many :users, through: users_messages
- belongs_to :group

## users_messagesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|message_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :message
>>>>>>> Stashed changes
