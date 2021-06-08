class CreatePractices < ActiveRecord::Migration[6.1]
  def change
    create_table :practices do |t|
      t.string :category
      t.string :system
      t.string :distance
      t.integer :times
      t.integer :set
      t.text :description

      t.timestamps
    end
  end
end
