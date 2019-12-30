# README

## アプリ概要
筋トレの成果を画像つきで共有できるコミュニティサイトです。転職活動用のポートフォリオとして作成致しました。

## 本番環境
<!-- https://morooka3.net/ -->

ログイン画面からテストユーザーでログインが可能です。

開発環境はdevelopブランチにあります。

## 機能一覧、使用gemなど
* ユーザー登録、ログイン機能 (device）
* ユーザープロフィール画像アップロード、変更機能(carrierwave)
* ツイート投稿機能
* ツイート画像投稿機能(carrierwave)
* いいね機能(ajax)
* ツイートへのコメント機能(ajax)
* ツイート一覧表示の際のページネーション機能(kaminari)
* ツイートの検索機能(LIKE句)
* レスポンシブデザイン（スマホサイズに対応）

## 使用技術
* Ruby 2.5.1
* Ruby on Rails 5.2.4.1
* MYSQL 5.6.43
* SASS
* GitHub,Git
* Rspec
<!-- * AWS
  * VPC
  * EC2
  * ECS
  * ECR 
  * RDS for MySQL 
  * ALB
  * Route53
  * S3
  * ACM -->

## テスト
* Rspec
  * 単体テスト（モデル、コントローラ）
  * 統合テスト
