# README
[本番環境URL](http://posilog.work/)※テストアカウントもあります。  
[Qiita説明ページURL](http://13.114.69.119/)※特にサービス開発に関しての想いをまとめています。

positiveな改善案のみを集めた口コミサイトです。既存の口コミサイトは評価を見える化したことですごく生活を便利にしてくれたと思います。  ただ、段々と既存の口コミサイトを利用するにつれて、問題意識を感じるようになったため、今回個人アプリ制作として開発をしてみました。特に問題を感じた課題とそれぞれの解決へのアプローチが下記になっております。

- 改善をしても低評価が残り続けてしまう  
  ⇛いいサービス＝「改善を継続してできるサービス」と定義をして、改善案を口コミとして集める。
- 影響力の大きさから起こる、サクラ等の存在  
  ⇛サクラがいたとしても本質的な改善がされるビジネスモデルにする。改善案をもらえたサービスには重量に応じて課金される形態を取る。もし多くの口コミを自ら作ったとしてもそれだけの改善をそのサービスは改善をされている＝「いいサービス」と考えることができる。

# 詳細
## 搭載機能
- 記事（一覧・詳細）表示機能
- 記事（投稿・削除・詳細・編集）機能
- ポジティブ・ネガティブ判定（GCP：cloud language natural　API)
- お名前ドットコム、Route53を用いた独自ドメイン化
- コメント機能
- DBテーブルリレーション管理
- 管理ユーザ登録機能（deviseを用いて、2つのモデルに適用）
- 'gem carrierwave'での複数画像アップロード機能
- 'gem gratel'を用いたパンくず機能
- 'gem ransack'を用いた検索機能
- 'gem kaminari'を用いたページネーション機能

## 予定機能（未実装）
- 単体テスト
- 統合テスト
- 課金機能（payjp)
- フォロー/フォロワー機能

## 開発環境
言語：Ruby 2.5.1
フレームワーク:Ruby on Rails　5.2.2.1、bootstrap４
DB:Mysql 5.6
デプロイ：AWS（EC2+S3）、capistrano

## イメージ図
![posilog_root](https://user-images.githubusercontent.com/33143111/63909949-c6f29000-ca5f-11e9-8c0d-65da98569c64.jpg)
  
<img width="821" alt="posilog_positive_score" src="https://user-images.githubusercontent.com/33143111/63910551-28b3f980-ca62-11e9-9dad-8c052b09a6f0.png">

# DB設計
## ER図
<img width="939" alt="posilog_ER" src="https://user-images.githubusercontent.com/33143111/63910018-03be8700-ca60-11e9-991c-58a5dffe720d.png">

## DB設計図
### Users テーブル
|Column          |Type   |Null|Options           |
|----------------|-------|----|------------------|
|id              |integer|not |                  |
|nickname        |string |not |                  |
|email           |string |not |unique:true       | 
|password        |integer|not |unique:true       |
|profile         |text   |not |                  |
|image           |string |    |                  |
|point           |integer|not |default:0         |

#### association
- has_many :logs
- has_many :comments

### Logs テーブル
|Column          |Type   |Null|Options          |
|----------------|-------|----|-----------------|
|id              |integer|not |                 |
|title           |integer|not |                 |
|kind            |string |not |                 |
|good            |text   |not |                 |
|chance          |text   |not |                 |
|good_score      |integer|not |                 |
|chance_score    |integer|not |                 |
|store_id        |integer|not |foreign_key:true |
|user_id         |integer|not |foreign_key:true |

#### association
- belongs_to :user
- has_many :comments
- has_many :store_comments
- belongs_to :store
- has_many :log_images,dependent: :destroy

### Stores テーブル
|Column          |Type   |Null|Options          |
|----------------|-------|----|-----------------|
|id              |integer|not |                 |
|name            |string |not |                 |
|kind            |string |not |                 |
|URL             |string |not |                 |
|profile         |text   |not |                 |

#### asociation
-  has_many :logs
-  has_many :coupons
-  has_many :store_comments

### Comments テーブル
|Column          |Type   |Null|Options          |
|----------------|-------|----|-----------------|
|id              |integer|not |                 |
|text            |text   |not |                 |
|kind            |string |not |                 |
|log_id          |integer|not |foreign_key:true |
|user_id         |integer|not |foreign_key:true |

#### asociation

- belongs_to :user  
- belongs_to :log

### Store_comments テーブル
|Column          |Type   |Null|Options          |
|----------------|-------|----|-----------------|
|id              |integer|not |                 |
|text            |text   |not |                 |
|kind            |string |not |                 |
|log_id          |integer|not |foreign_key:true |
|store_id        |integer|not |foreign_key:true |

#### asociation

- belongs_to :store  
- belongs_to :log


### Coupons テーブル
|Column          |Type   |Null|Options          |
|----------------|-------|----|-----------------|
|id              |integer|not |                 |
|reason          |string |not |                 |
|product         |string |not |                 |
|discount        |text   |not |                 |
|limit           |integer|not |                 |
|writing         |string |not |                 |
|image           |string |    |                 |
|status          |integer|not |default:0        |
|store_id        |integer|not |foreign_key:true |

#### asociation 
- belongs_to :store


### Log_imagesテーブル
|Column          |Type   |Null|Options          |
|----------------|-------|----|-----------------|
|id              |integer|not |                 |
|image           |string |not |foreign_ket:true |
|log_id          |string |not |foreign_ket:true |

#### association
- belongs_to :log
