# SwiftLab

### ファイル構造

# サイトマップ
- +- /js
- +- /css
- |- index.html

# ソースコード

## testCode
- Base
- App
- Debug
- Battery
- Managers
- Swiftの勉強

# Githubの運用フロー
- Issues の 作成
- Project の 作成
- Pull requests の 作成

## Issues の作成
Issuesの記事は、TODOの場合と一時的なものがあります。
ケース１）基本的にはやることリスト：TODOは、リリース毎に分けて小まめに分割した方が良い。

ケース２）一時的なトラブルなどの対応に関しては、Closeして対応する
Closeする際は必ずMilestoneを設定すること。

Issuesを設定する際は、Label付けに注意する緊急度が高いものは「現職の赤」を設定、種類とカテゴリーに分けるとわかりやすい。

種類：iOS / Android / WEB 対応
カテゴリー：緊急時のもの、削除理由（重複記事、必要がなくなった場合など）、要望

## Pull requestsの作成
基本的に、HTML / Swift のプログラミングの方の作業が発生した時に使用
Gitフローに関しては

- master
- develop -> feature/開発しているプロジェクト名_開発OS_Issue番号 が理想
- タグなどを用いてバージョン管理していく
- staging
- バージョンについては、環境_年日付がベスト

## Projectの作成
基本的に、ドキュメント化 / 記事化 / サイト化 / プログラミング化 として運用
Issues / Pull Requests

基本的には、作成時に設定する。

呼んでおく内容読み物

## Labelとは
Labelの用途 一覧で見た時にどの項目があるのか一目で分かる：タグ付けみたいなもの


プロジェクト設定

|No|種類名|詳細|
|--|--|--|
|0001|種別|--|
|0002|カテゴリ|--|
|0003|発生バージョン/マイルストーン|--|

# 種別の一覧（ヘルプ）
（＋）種別の追加
（×）種別の削除

|No|種別名|詳細|
|--|--|--|
|0001|first issues|タスクを初めてつけたら|
|0002|調査|--|
|0003|不具合【bug】|--|
|0004|要望|--|
|0005|通報|--|
|0006|お問い合わせ|--|
|0007|内部起票|--|
|0008|持ち越し課題|--|
|0009|その他|--|
|1000|duplicate|重複：記事が複数ある場合ークローズする|
|1001|enhancement|強化|
|1002|help wanted|求人|
|1003|question|疑問：不思議謎の原因などがある場合|
|1004|invalid|無効：間違い、勘違い、実現不可の場合。対応しない内容を書いてクローズ|
|1005|wontfix|不対応：対応しないバグ等がある場合。対応しない理由を書いてクローズ|

|ラベル|意味|
|--|--|
|help wanted|助けを求める場合|
|bug|バグの場合|
|duplicate|すでに内容の重複したIssueが存在する場合|
|enhancement|機能強化の場合|
|invalid|間違い、勘違い、実現不可の場合。対応しない内容を書いてクローズ|
|question|疑問がある場合|
|wontfix|対応しないバグ等がある場合。対応しない理由を書いてクローズ|


並び順を変更（）内の数字は、種別に属する課題件数

# カテゴリーの一覧（ヘルプ）
（＋）カテゴリーの追加
（×）カテゴリーの削除

|No|カテゴリー名|詳細|
|--|--|--|
|0001|その他|--|
|0002|確認|--|
|0003|要望|--|
|0004|バグ|--|
|0005|iOS|--|
|0006|Android|--|
|0007|WEB|--|
|0008|API|--|
|0009|PHP|--|
|0010|LP|--|
|0011|インフラ|--|
|0012|テーブル|--|
|0013|プロジェクト推進|--|
|0014|GA設定|--|

並び順を変更（）内の数字は、カテゴリーに属する課題件数


## Milestoneとは
プロジェクトの締め切りが設定できる：バージョン管理に役立つ

## Projectとは
第項目としてのプロジェクト設定できる：基本大きな単位としてのプロジェクト

レポジトリの中にプロジェクト複数設定することが可能

# 発生バージョン/マイルストーンの一覧（ヘルプ）
（＋）発生バージョン/マイルストーンの追加
（×）発生バージョン/マイルストーンの削除

|No|発生バージョン/マイルストーン|詳細|
|--|--|--|
|0001|1.0.0|--|
|0002|iOS1.0.0|--|
|0003|Android1.0.0|--|

並び順を変更（）内の数字は、カテゴリーに属する課題件数

# 発生バージョン/マイルストーンの詳細（ヘルプ）
### 発生バージョン / マイルストーン名の変更

## 日付の設定
### 開始日
YYYY/MM/DDで入力してください。例：2005/06/01
### 終了日
YYYY/MM/DDで入力してください。例：2005/06/01
開始日と終了日を設定することで、バーンダウンチャートを表示することができます。

### 詳細
この発生バージョン/マイルストーンの説明です。例：「バージョン1.0のマイルストーンリリース第１弾」

### プロジェクトホームに表示しない
- [ ] プロジェクトホームに表示しない

この発生バージョン/マイルストーンが完了した場合に、
チェックを入れるとプロジェクトホームとシンプルな課題の検索に表示されなくなります。

### 登録

|No|機能名|詳細|
|--|--|--|
|0001|発生バージョン/マイルストーン名の変更|--|
|0002|発生バージョン/マイルストーン日付設定：開始日|YYYY/MM/DDで入力してください。例：2005/06/01|
|0002|発生バージョン/マイルストーン日付設定：終了日|YYYY/MM/DDで入力してください。例：2005/06/01|
|0003|発生バージョン/マイルストーン詳細|この発生バージョン/マイルストーンの説明です。例：「バージョン1.0のマイルストーンリリース第１弾」|
|0004|発生バージョン/マイルストーンのプロジェクトホームに表示しない|この発生バージョン/マイルストーンが完了した場合に、チェックを入れるとプロジェクトホームとシンプルな課題の検索に表示されなくなります。|
|0005|発生バージョン/マイルストーンの編集ヘルプ|--|

