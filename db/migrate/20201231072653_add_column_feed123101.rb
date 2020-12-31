class AddColumnFeed123101 < ActiveRecord::Migration[6.0]
  def change
    add_column :feeds, :url, :string, null: false
    add_column :feeds, :node, :string, null: false
    add_column :feeds, :status, :integer, null: false
    add_column :feeds, :node_type, :string, null: false
  end
end