class Feed < ApplicationRecord

  scope :show, ->(id, user_id) { where(id: id).where(user_id: user_id) }

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
