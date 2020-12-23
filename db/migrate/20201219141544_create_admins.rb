class CreateAdmins < ActiveRecord::Migration[6.0]
  def change
    create_table :admins do |t|
      t.string :type, null: false
      t.text :node, null: false

      t.timestamps
    end
  end
end
