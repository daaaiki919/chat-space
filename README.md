# データベース設計

---

## ChatSpaceの機能
①. 新規登録機能   ②.1対1のチャット機能 ③.複数人によるグループチャット機能 ④.チャット相手の検索機能   
⑤.チャットグループへのユーザー招待機能 ⑥.チャットの履歴表示機能 ⑦.画像送信機能 ⑧.チャットの自動更新

---

#### usersテーブル

| column     |    type     |
|:-----------|------------:|
| id         |     integer |
| name       |      string |
| group_id   |     integer |


#### imageテーブル

| column     |    type     |
|:-----------|------------:|
| id         |     integer |
| name       |      string |


#### messagesテーブル

| column     |    type     |
|:-----------|------------:|
| body       |        text |
| image      |      string |
| group_id   |     integer |
| user_id    |     integer |

---

### アソシエーション

・has_many :image   
・has_many :messages

### 制約

・NOT NULL制約  
・一意性制約  
・主キー制約  
・外部キー制約  