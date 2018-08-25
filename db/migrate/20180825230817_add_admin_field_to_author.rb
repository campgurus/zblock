class AddAdminFieldToAuthor < ActiveRecord::Migration[5.1]
  def change
    add_column :authors, :admin, :boolean
  end
end
