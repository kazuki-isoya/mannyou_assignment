# README

## テーブル
---
- ### Task
|Columm |Type |
|-------|-----|
|id     |     |
|title  |string |
|content | text |

---

## Herokuへデプロイ手順
1. ログインする
 - デプロイするアプリがカレントディレクトリになっていることを確認し、
 ```heroku login ```

 - ターミナルの指示通りにキーを押し、Herokuのwebに飛ぶのでログインする


2. データベースを作成
  ```heroku create```


3. Herokuへプッシュする
  ```git push heroku master ```
  - プッシュする前にアセットコンパイルを忘れずに
  - ブランチがmasterになっていることを確認する、マージし忘れに注意する


4. マイグレーションを実行
  ```heroku run rails db:migrate```
