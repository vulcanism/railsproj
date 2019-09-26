# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_09_26_194225) do

  create_table "comments", force: :cascade do |t|
    t.string "content"
    t.integer "user_id"
    t.integer "observation_id"
    t.index ["observation_id"], name: "index_comments_on_observation_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "cryptids", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.string "size"
    t.string "classification"
  end

  create_table "observations", force: :cascade do |t|
    t.string "name"
    t.datetime "date"
    t.string "note"
    t.integer "user_id"
    t.integer "cryptid_id"
    t.index ["cryptid_id"], name: "index_observations_on_cryptid_id"
    t.index ["user_id"], name: "index_observations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "uid"
    t.string "provider"
  end

end
