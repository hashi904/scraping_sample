# learnign in this application list
## 設計周り
- 設計が曖昧なままコーディングに入るとプロダクトの完成度が近づくに連れて齟齬が発生する
## Ruby
- class console meanig
```ruby
class Hoge
  def initialize(item:)
    @item = item
  end
end

Hoge.new(item: 'hoge')
```

=> #<Hoge:0x00007fb11e19b690 @item="hoge">
(includes isntace variable @item)

## Rails
- lib配下を読み込ませる方法
```ruby
# config/application.rb
config.autoload_paths += ['lib']
```
- 注意
  -  ファイルの頭の文字が同じだとうまく読みこない
  - ex) Scrape::ScrapingService

- postgresql の設定
- commandの実行
  - createdb hoge_db user_name
- settings.ymlを書き換え

- sessionメソッドはmodelでは直接呼び出せない、、、らしい

## model validation
- 正規表現でvalidation
```ruby
validation reqular expression
validates :name, format: { with: REGEXP }
```

### DB周り
```sh
# add column
$ rails generate migration クラス名 カラム名:データ型( カラム名:データ型)
$ rails generate migration AddColumnAdmins

# change column name
$ rails generate migration rename_[変更前のカラム名]_column_to_[モデル名(複数形)]

# migrate
$ rake db:migrate
```

## 疑問
- Rails Consoleでsessionメソッドを使うには何をrequire/includeすればいいのだろうか？
- Railsのapiのエラーハンドリングはどうしたらいい？ raiseだと500が返ってきてclient側だと何が起こったのか一切わからない
  - returnでちゃんと返してないだけだった
