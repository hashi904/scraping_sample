class AddColumnAdmins < ActiveRecord::Migration[6.0]
  def change
    add_column :admins, :status, :integer
  end
end
