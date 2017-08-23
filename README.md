# 準備

1. まずは以下のコマンドでローカルにgithubのソースコードを反映させる。

```
git pull origin master
```

2. 次のコマンドで必要なライブラリをインストールする。

```
gem install bundler
bundle install
```

3. `twi.rb`のoptionsにキーを設定する。

4. 次のコマンドでメインファイルを実行する。初期状態だと、村瀬のツイートにリプが飛ぶ。

```
ruby twi.rb
```
