class RenameTypeColumnToAdmins < ActiveRecord::Migration[6.0]
  def change
    rename_column :admins, :type, :url
  end
end
