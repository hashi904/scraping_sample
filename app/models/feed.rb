class Feed < ApplicationRecord
  belongs_to :admin

  def save_node(url, node, scrape_type)
    text ||= scraping_execute(url, node, scrape_type)
  end

  private

  def scraping_execute(url, node, scrape_type)
    Scrape::NokogiriService.new(url: url, node: node, scrape_type: scrape_type)
                           .execute
  end
end
