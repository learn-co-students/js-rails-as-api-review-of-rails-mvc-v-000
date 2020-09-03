ActiveRecord::Schema.define(version: 2019) do

  create_table "birds", force: :cascade do |t|
    t.string "name"
    t.string "species"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end