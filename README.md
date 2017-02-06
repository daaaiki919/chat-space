# データベース設計

---

## ChatSpaceの機能
①. 新規登録機能   ②.1対1のチャット機能 ③.複数人によるグループチャット機能 ④.チャット相手の検索機能   
⑤.チャットグループへのユーザー招待機能 ⑥.チャットの履歴表示機能 ⑦.画像送信機能 ⑧.チャットの自動更新

---

#### usersテーブル

| column                  |    type     |
|:------------------------|------------:|
| id(主キー制約)            |     integer |
| name(NOT NULL)(一意性制約)|      string |
| group_id(主キー制約)      |     integer |

・has_many :image ・has_many :messages ・has_many :group


#### imageテーブル

| column                 |    type     |
|:-----------------------|------------:|
| id(外部キー制約)          |     integer |
| name                   |      string |


・belongs_to :user


#### groupテーブル

| column                    |    type     |
|:--------------------------|------------:|
| id(外部キー制約)            |     integer |
| name(NOT NULL)(一意性制約)  |      string |


belongs_to :user


#### messagesテーブル

| column               |    type     |
|:---------------------|------------:|
| body(NOT NULL)       |        text |
| image                |      string |
| group_id(外部キー制約)  |     integer |
| user_id(外部キー制約)   |     integer |


belongs_to :user belongs_to :group

---
