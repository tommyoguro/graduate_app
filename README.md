# 開発言語

ruby 3.3.0
rails 6.1.7.7

## 実行手順

$ git clone [git@github.com](mailto:git@github.com):sample/sample_app.git
$ cd sample_app
$ bundle install
$ rails db:create && rails db:migrate
$ rails s

### プロジェクトタイトル

B to Bビジネス用途 Matching E/Cアプリの構築
B to B Matching ECアプリケーション名称 『B-TRADE』
B to Bビジネスを対象としたMatching E/C ( Electric Commerce ) サイトを立ち上げること

### 概要

なぜ『B-TRADE』を開発したのか？		
B to Bビジネスにおいては以下理由により『人対人』による取引や折衝が一般的である。												
理由												
①取引規模がB to C、C to Cと比べると高額な為												
②複数の関係者が決裁に関わる為

しかしながら、上記取引の中には『少額、かつ短納期』で必要な（折衝に多くの工数を掛ける必要のない）												
取引も一定割合あり、『人対人』による取引が不要（非効率）→ EC(Electric Commerce)により												
効率的な取引を実現できるサービスニーズがあるのではないかと思い開発。

またB to Bビジネスにおいて買い手（買いたい人）と売り手（売りたい人）をインターネットを通じて繋げる、												
マッチングするサービスニーズもあると思い開発

同ECアプリ取引の対象は①取引金額が10百万円未満であること、②短納期（１０営業日以内での納品）であること												
③細かい取引条件交渉が不要であること（複数の関係者による決裁が不要であること）である。

同サービス利用により、高額取引・重要取引については引き続き『人対人』による折衝で、かつ時間を掛けて												
取引をしてもらい、それ以外の取引については同ECアプリでクイックに、効率的に取引をしてもらい、												
人手不足、かつ限られた時間を有効活用し、アウトプットを出して頂きたい。

どのような問題を解決するために開発したのか？												
誰の : 右図の通り、ユーザー（販売先）、サプライヤー（仕入先）、商社（卸売企業）

問題：（ユーザー側）短納期で欲しいにもかかわらず、担当者（人）がつかまらない

レスポンス、回答（問い合わせ、見積等）が遅い												
欲しい商品がすぐに見つけられない

問題：（サプライヤー側）少額で利益が少ない割に手間がかかる												
人手が足りず、高額取引を優先し、少額取引の優先度が下がってしまう												
売りたい商品があるにもかかわらず、買い手が見つからない

問題：（商社・卸売側）少額で利益が少ない割に手間がかかる												
人手が足りず、高額取引を優先し、少額取引の優先度が下がってしまう												
双方（ユーザー、サプライヤー）とのコミュニケーション工数がかかる。

https://github.com/user-attachments/assets/61c37c84-3981-4784-8719-89039a105b08

### 機能説明	優先度

1		ユーザー登録										高						
ユーザー登録機能

2		ログイン・サインイン									高						
ログイン・サインイン機能

３		ログアウト										高						
ログアウト機能

4		管理者設定										高						
管理者機能

5		CRUDアイテム										高						
CRUD機能

6		見積依頼機能										高						
入力フォームより見積依頼が出来る機能

7		見積回答機能										高						
入力フォームより見積依頼に対して回答（オファー）出来る機能

8		見積依頼一覧表示機能									高						
全見積依頼を一覧表で表示する機能

9		メール送信機能										高						
ユーザーに対するメール送信機能

### カタログ設計

https://docs.google.com/spreadsheets/d/1kMgj0mwEnhFxvtPUdPMxrRiotgmSvfesFfK1T65JSDw/edit?usp=sharing

####### テーブル定義書
https://docs.google.com/spreadsheets/d/1kMgj0mwEnhFxvtPUdPMxrRiotgmSvfesFfK1T65JSDw/edit?usp=sharing

######### ワイヤーフレーム

https://cacoo.com/diagrams/s5L6ngqeZZ05JoF3/E588C

https://github.com/user-attachments/assets/f9e850cc-61ae-4987-a80a-ff7ec1f293b3

https://github.com/user-attachments/assets/1ff6c90f-e15a-4cf0-a631-48ace25225f7

######### ER図

https://github.com/user-attachments/assets/44a50346-000a-4fb6-ac80-b9306944af1a