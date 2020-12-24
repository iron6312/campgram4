### アプリケーション名
・campgram4

### アプリケーション概要
・ユーザーが新規投稿でキャンプ場の情報を発信でます。投稿に関してコメントやいいねができます。自身でキャンプに行くときに忘れ物を防ぐためのチェックがで来ます。ログイン、ログアウトができる。新規登録時の公表可能部分をユーザーページで参照します。

### URL
・https://campgram4.herokuapp.com/

### テスト用アカウント
・email: aaa@aaa
・password: 1111qq

### 利用方法
・キャンプ専門のアプリなので、ターゲットは限定されています。キャンプ初心者〜上級者まで様々な人が使用し自身で行ったキャンプ場の写真やオススメ、投稿者観点の説明などを投稿でき、まだ行ったことない人や初心者はその投稿を参考にすることができます。加えて忘れ物チェックができます。

### 目指した課題解決
・キャンプ好きな人同しで情報共有ができます。キャンプ場によってはホームページがなく、実際に行かないとわからなかったり、実際に行った人でないとわからない観点なども見ればわかるので参考になります。特に初心者は上級者がどんなに行くかやどんな道具を使うかが気になるので参考になります。

### 洗い出した要件
## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| email              | string              | null: false             |
| password           | string              | null: false             |
| nickname           | string              | null: false             |
| camp_history       | string              | null: false             |
| age                | string              | null: false             |
| favorite_camp_type | string              | null: false             |

# Association
* has_many :gears
* has_many :post, dependent: :destroy
* has_many :comments
* has_many :likes, dependent: :destroy
* has_many :liked_posts, through: :likes, source: :post

## posts table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| title       | string     | null: false       |
| description | text       | null: false       |
| recomended  | string     | null: false       |
| user        | references | foreign_key: true |

# Association
* belongs_to :user
* has_many :comments, dependent: :destroy
* has_many :likes, dependent: :destroy
* has_many :liked_users, through: :likes, source: :user
* has_one_attached :image

## comments table

| Column | Type       | Options           |
|--------|------------|-------------------|
| text   | text       | null: false       |
| user   | references | foreign_key: true |
| post   | references | foreign_key: true |

# Association
* belongs_to :post
* belongs_to :user

## likes table

| Column | Type       | Options           |
|--------|------------|-------------------|
| user   | references | foreign_key: true |
| post   | references | foreign_key: true |

# Association
* belongs_to :post
* belongs_to :user


### 実装した機能についてのGIFと説明
・投稿機能：他ユーザーと情報の共有ができます。
・コメント機能：投稿に対してコメントできます。
・いいね機能：投稿に対していいねできます。

### 実装予定の機能
・検索機能

### ローカルでの動作方法
・Ruby: 2.6.5
・Rails: 6.0.3.4
・https://github.com/iron6312/campgram4.git
・rails _6.0.0_ new campgram4 -d mysql
・rails db:create
・rails db:migrate