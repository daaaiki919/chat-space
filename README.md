# データベース設計

---

## ChatSpaceの機能
①. 新規登録機能   ②.1対1のチャット機能 ③.複数人によるグループチャット機能 ④.チャット相手の検索機能   
⑤.チャットグループへのユーザー招待機能 ⑥.チャットの履歴表示機能 ⑦.画像送信機能 ⑧.チャットの自動更新

---
<br>
<br>
<br>
#### usersテーブル

| column                  |    type     |
|:------------------------|------------:|
| name(NOT NULL)(一意性制約)|      string |

・has_many :messages<br>・has_many :groups, through: :group_users

ログイン機能に関してはgem(devise)を使用

<br>
<br>
#### groupsテーブル

| column                    |    type     |
|:--------------------------|------------:|
| name(NOT NULL)(一意性制約)  |      string |

・has_many :messages <br>・has_many :users, through: :group_users

<br>
<br>
#### group_usersテーブル

| column               |    type     |
|:---------------------|------------:|
| user_id(外部キー制約)   |     integer |
| group_id(外部キー制約)  |     integer |

<br>
<br>
#### messagesテーブル

| column               |    type     |
|:---------------------|------------:|
| body(NOT NULL)       |        text |
| image                |      string |
| group_id(外部キー制約)  |     integer |
| user_id(外部キー制約)   |     integer |


・belongs_to :user <br>・belongs_to :group

---
