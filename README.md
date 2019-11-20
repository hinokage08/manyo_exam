# README

## モデル
* Userモデル

|カラム名|データ型|
|:---:|:---:|
|id|integer|
|name|string|
|password_digest|string|
|email|string|
|admin|boolean|


* Taskモデル

|カラム名|データ型|
|:---:|:---:|
|id|integer|
|deadline|date|
|status|integer|
|task_name|string|
|content|text|
|created_at|datetime|
|updated_at|datetime|
|priority|integer|
|user_id|bigint|


* Labelモデル

|カラム名|データ型|
|:---:|:---:|
|id|integer|
|name|string|
|created_at|datetime|
|updated_at|datetime|
|user_id|bigint|


---
## Herokuへのデプロイ手順
1. Herokuへログイン

 `$ heroku login`

1. Herokuにデプロイ
  - Herokuにアプリケーションを作成していない場合

    `$ heroku create`

  - Herokuにアプリケーションを作成している場合

    `$ git add .`

    `$ git commit -m 'コメント'`

    `$ git push origin master`
