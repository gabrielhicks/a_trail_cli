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

ActiveRecord::Schema.define(version: 8) do

  create_table "bios", force: :cascade do |t|
    t.integer "level"
    t.string "name"
  end

  create_table "characters", force: :cascade do |t|
    t.string "name"
  end

  create_table "skills", force: :cascade do |t|
    t.integer "coding", default: 1
    t.integer "electricity", default: 1
    t.integer "hunger", default: 1
    t.integer "education", default: 1
    t.integer "happiness", default: 1
  end

  create_table "stories", force: :cascade do |t|
    t.string "name"
    t.integer "character_id"
  end

  create_table "user_bios", force: :cascade do |t|
    t.integer "user_id"
    t.integer "bio_id"
  end

  create_table "user_skills", force: :cascade do |t|
    t.integer "user_id"
    t.integer "skill_id"
  end

  create_table "user_stories", force: :cascade do |t|
    t.integer "user_id"
    t.integer "story_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
  end

end
