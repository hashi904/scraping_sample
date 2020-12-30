class AddColumnAdmins20201230 < ActiveRecord::Migration[6.0]
  def change
    add_column :admins, :node_type, :string, null: false
  end
end
