ActiveRecord::Schema.define(version: 2020_11_02_175908) do
  
  create_table "consoles", force: :cascade do |t|
    t.string "name"
  end

  create_table "games", force: :cascade do |t|
    t.string "title"
    t.integer "release_year"
    t.string "genre"
    t.string "description"
    t.string "developer"
    t.integer "user_id"
    t.integer "console_id"
    t.boolean "complete", default: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "username"
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end
  
end
