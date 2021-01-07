require 'open-uri'

module Scrape
  # testing command
  # scraper = Scrape::NokogiriService.new(url: 'https://qiita.com/search?q=ruby', node: '//h1[@class="searchResult_itemTitle"]', node_type: 'XPATH')
  # scraper.execute

  # scrape service class used by nokogiri
  class NokogiriService
    def initialize(url:, node_type:, node:)
      @url = url
      @node_type ||= node_type
      @node = node
    end

    def execute
      # todo try 404　対応
      # http errorをキャッチする場所
      doc = Nokogiri::HTML(URI.open(@url))
      case @node_type
      when 'CSS'
        by_css(doc)
      when 'XPATH'
        by_xpath(doc)
      when 'OTHER'
        by_others(doc)
      else
        nil
      end
    end

    private

    def by_css(doc)
      doc.css(@node).each do |link|
        link.content
      end
    end

    def by_xpath(doc)
      doc.xpath(@node).each do |link|
        link.content
      end
    end

    def by_others(doc)
      doc.search(@node).each do |link|
        link.content
      end
    end
  end
end
