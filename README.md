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

## Milestoneとは
プロジェクトの締め切りが設定できる：バージョン管理に役立つ

## Projectとは
第項目としてのプロジェクト設定できる：基本大きな単位としてのプロジェクト

レポジトリの中にプロジェクト複数設定することが可能

