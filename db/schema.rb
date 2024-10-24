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

ActiveRecord::Schema[8.0].define(version: 2024_10_22_125212) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "ingredients", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_ingredients_on_name", unique: true
  end

  create_table "ingredients_recipes", id: false, force: :cascade do |t|
    t.bigint "ingredient_id", null: false
    t.bigint "recipe_id", null: false
  end

  create_table "recipes", force: :cascade do |t|
    t.string "author"
    t.string "category"
    t.interval "cook_duration"
    t.string "cuisine"
    t.string "image"
    t.string "ingredient_list", array: true
    t.interval "prep_duration"
    t.float "rating"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end
