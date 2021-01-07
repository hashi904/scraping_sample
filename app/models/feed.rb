class Feed < ApplicationRecord

  class << self
    def save_node(url:, node:, node_type:)
      text ||= scraping_execute(url, node, node_type)
      text
    end
  end

  private

  class << self
    def scraping_execute(url, node, node_type)
      Scrape::NokogiriService.new(url: url, node: node, node_type: node_type)
                             .execute
    end
  end
end
