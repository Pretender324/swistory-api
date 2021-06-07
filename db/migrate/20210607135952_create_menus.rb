class CreateMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :menus do |t|
      t.string :level
      t.string :aim
      t.text :description

      t.timestamps
    end
  end
end
