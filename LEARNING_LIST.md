# learnign in this application list
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