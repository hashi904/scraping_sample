class Admins < ActiveRecord::Migration[6.0]
  def change
    add_column :admins, :node_type, :string
  end
end
