class AddMenuToPractices < ActiveRecord::Migration[6.1]
  def change
    add_reference :practices, :menu, null: false, foreign_key: true
  end
end
