# データベース設計

---

## ChatSpaceの機能
①. 新規登録機能   ②.1対1のチャット機能 ③.複数人によるグループチャット機能 ④.チャット相手の検索機能   
⑤.チャットグループへのユーザー招待機能 ⑥.チャットの履歴表示機能 ⑦.画像送信機能 ⑧.チャットの自動更新

---

#### usersテーブル

| column                  |    type     |
|:------------------------|------------:|
| id(主キー制約)            |      integer|
| name(NOT NULL)(一意性制約)|      string |

・has_many :messages 

#### groupテーブル

| column                    |    type     |
|:--------------------------|------------:|
| id(外部キー制約)            |     integer |
| name(NOT NULL)(一意性制約)  |      string |

・has_many :messages ・belongs_to :user

#### users_groupテーブル

| column               |    type     |
|:---------------------|------------:|
| user_id(外部キー制約)   |     integer |
| group_id(外部キー制約)  |     integer |



#### messagesテーブル

| column               |    type     |
|:---------------------|------------:|
| body(NOT NULL)       |        text |
| image                |      string |
| group_id(外部キー制約)  |     integer |
| user_id(外部キー制約)   |     integer |


belongs_to :user belongs_to :group

---
