class AddOnTimeToPractices < ActiveRecord::Migration[6.1]
  def change
    add_column :practices, :on_time, :string
  end
end
