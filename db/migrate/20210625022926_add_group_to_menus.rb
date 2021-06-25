class AddGroupToMenus < ActiveRecord::Migration[6.1]
  def change
    add_reference :menus, :group, null: false, foreign_key: true
  end
end
