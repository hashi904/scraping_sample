require 'open-uri'

module Scrape
  # scraping class
  # scraper = Scrape::ScrapingService.new(url: 'https://qiita.com/search?q=ruby', node: '//h1[@class="searchResult_itemTitle"]', scrape_type: 'XPATH')
  # scraper.execute
  def self.item
    puts 'hello'
  end
  class Hoge
  end

  class ScrapingService
    # urlを引数として受け取ってscrapingした値を返す(配列の方がいい？
    def initialize(url:, node:, scrape_type:)
      @url = url
      @node = node
      @scrape_type ||= scrape_type
    end

    # 多分ダックタイピングが使える
    def execute
      doc = Nokogiri::HTML(URI.open(@url))
      case scraping_type
      when CSS
        by_css(doc)
      when XPATH
        by_xpath(doc)
      when OTHER
        by_others(doc)
      else
        nil
      end
    end

    private

    def by_css(doc)
      doc.css(@node).each do |link|
        # dataを作成する
        puts link.content
      end
    end

    def by_xpath(doc)
      doc.xpath(@node).each do |link|
        # dataを作成する
        puts link.content
      end
    end

    def by_others(doc)
      doc.search(@node).each do |link|
        # dataを作成する
        puts link.content
      end
    end

    def insert
      # modelを呼び出す
    end
  end
end
