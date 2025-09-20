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

ActiveRecord::Schema[8.0].define(version: 2025_09_20_184513) do
  create_table "chapters", force: :cascade do |t|
    t.string "title"
    t.integer "page"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "number"
  end

  create_table "examples", force: :cascade do |t|
    t.integer "page"
    t.string "en_us"
    t.string "es_mx"
    t.integer "root_word_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["root_word_id"], name: "index_examples_on_root_word_id"
  end

  create_table "expressions", force: :cascade do |t|
    t.string "en_us"
    t.string "es_mx"
    t.integer "page"
    t.integer "root_word_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["root_word_id"], name: "index_expressions_on_root_word_id"
  end

  create_table "root_words", force: :cascade do |t|
    t.string "display_name"
    t.integer "page"
    t.integer "chapter_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chapter_id"], name: "index_root_words_on_chapter_id"
  end

  add_foreign_key "examples", "root_words"
  add_foreign_key "expressions", "root_words"
  add_foreign_key "root_words", "chapters"
end
