# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_210_609_023_835) do
  create_table 'groups', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'menus', force: :cascade do |t|
    t.string 'level'
    t.string 'aim'
    t.text 'description'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'group_id', null: false
    t.index ['group_id'], name: 'index_menus_on_group_id'
  end

  create_table 'practices', force: :cascade do |t|
    t.string 'category'
    t.string 'system'
    t.string 'distance'
    t.integer 'times'
    t.integer 'set'
    t.text 'description'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'on_time'
    t.integer 'menu_id', null: false
    t.index ['menu_id'], name: 'index_practices_on_menu_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name'
    t.string 'sex'
    t.string 'email'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  add_foreign_key 'menus', 'groups'
  add_foreign_key 'practices', 'menus'
end
