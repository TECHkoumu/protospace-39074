# テーブル設計

## usersテーブル

| Column             |  Type  |     Options |
| ------------------ | ------ | ----------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| name               | string | null: false |
| profile            | text   | null: false |
| occupation         | text   | null: false |
| position           | text   | null: false |

## Association
- has_many :prototypes
- has_many :comments

## ユニーク制約の追加
`users`テーブルの`email`カラムにユニーク制約を追加する方法
1. マイグレーションファイルを作成
   ```ruby
   class AddUniqueIndexToUsersEmail < ActiveRecord::Migration[6.1]
     def change
       add_index :users, :email, unique: true
     end
   end

2.マイグレーション実行
% rails db:migrate

3.rails test

## prototypesテーブル

| Column     | Type       | Options    |
| ---------- | ---------- | ---------- |
| title      |   string   | null: false|
| catch_copy |    text    | null: false|
| concept    |    text    | null: false|
| user       | references | null: false,foreign_key: true|

## Association
- belongs_to :users
- has_many :comments

## commentsテーブル

| Column       | Type       | Options                       |
| ------------ | ---------- | ----------------------------- |
| content      | text       | null: false                   |
| prototype    | references | null: false, foreign_key:true |
| user         | references | null: false, foreign_key:true |


## Association

- belong_to :users
- belong_to :prototypes
