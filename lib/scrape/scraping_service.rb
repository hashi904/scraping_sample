require 'open-uri'

module Scrape
  # scraping class
  # scraper = Scrape::ScrapingService.new(url: 'https://qiita.com/search?q=ruby', node: '//h1[@class="searchResult_itemTitle"]', scrape_type: 'XPATH')
  # scraper.execute
  class ScrapingService
    def initialize(url:, node:, scrape_type:)
      @url = url
      @node = node
      @scrape_type ||= scrape_type
    end

    # todo リファクタリング
    def execute
      doc = Nokogiri::HTML(URI.open(@url))
      case scraping_type
      when CSS
        by_css(doc)
      when XPATH
        return by_xpath(doc)
      when OTHER
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
