# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170329211312) do

  create_table "address", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string  "street1",      limit: 250
    t.string  "street2",      limit: 250
    t.string  "city",         limit: 250
    t.integer "state"
    t.integer "country"
    t.string  "zip_code",     limit: 50
    t.string  "plot_number",  limit: 50
    t.string  "floor_number", limit: 50
  end

  create_table "advert", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.text     "title",         limit: 65535
    t.text     "text",          limit: 65535
    t.datetime "advert_date"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "user_id"
    t.string   "advert_number", limit: 45
  end

  create_table "audits", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "auditable_id"
    t.string   "auditable_type"
    t.integer  "associated_id"
    t.string   "associated_type"
    t.integer  "user_id"
    t.string   "user_type"
    t.string   "username"
    t.string   "action"
    t.text     "audited_changes", limit: 65535
    t.integer  "version",                       default: 0
    t.string   "comment"
    t.string   "remote_address"
    t.string   "request_uuid"
    t.datetime "created_at"
    t.index ["associated_id", "associated_type"], name: "associated_index", using: :btree
    t.index ["auditable_id", "auditable_type"], name: "auditable_index", using: :btree
    t.index ["created_at"], name: "index_audits_on_created_at", using: :btree
    t.index ["request_uuid"], name: "index_audits_on_request_uuid", using: :btree
    t.index ["user_id", "user_type"], name: "user_index", using: :btree
  end

  create_table "buyer", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.bigint  "person_id",                  null: false
    t.bigint  "property_id",                null: false
    t.decimal "min_budget",  precision: 18
    t.decimal "max_budget",  precision: 18
    t.index ["person_id"], name: "FK_Buyer_Person", using: :btree
    t.index ["property_id"], name: "FK_Buyer_Property", using: :btree
  end

  create_table "ckeditor_assets", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.string   "data_fingerprint"
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type", using: :btree
  end

  create_table "contact", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "surname",       limit: 45
    t.string   "first_name",    limit: 45
    t.string   "email_address", limit: 45
    t.string   "message",       limit: 1000
    t.datetime "message_date"
  end

  create_table "dictionary", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string   "code",          limit: 50,    null: false
    t.string   "label",         limit: 250,   null: false
    t.string   "category",      limit: 50,    null: false
    t.text     "description",   limit: 65535
    t.datetime "creation_date"
  end

  create_table "feature", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.bigint "property_id",                null: false
    t.string "feature_name", limit: 150
    t.text   "description",  limit: 65535
    t.index ["property_id"], name: "FK_Feature_Property", using: :btree
  end

  create_table "file", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "file_name",       limit: 150
    t.string "file_path",       limit: 250,              collation: "utf8_general_ci"
    t.string "extension",       limit: 10,  null: false
    t.string "title",           limit: 100
    t.bigint "size"
    t.string "owner_unique_id", limit: 150
  end

  create_table "lease", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.bigint "property_id", null: false
  end

  create_table "news", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.text     "text",        limit: 4294967295
    t.datetime "news_date"
    t.datetime "expiry_date"
    t.integer  "user_id"
    t.string   "title",       limit: 1000
  end

  create_table "payment", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.bigint "property_id"
  end

  create_table "person", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string   "first_name",        limit: 50, null: false
    t.string   "last_name",         limit: 50, null: false
    t.string   "middle_name",       limit: 50
    t.integer  "gender"
    t.integer  "marital_status"
    t.integer  "religion"
    t.bigint   "address_id"
    t.integer  "person_type",                  null: false
    t.datetime "birth_date"
    t.datetime "registration_date"
    t.integer  "status"
    t.string   "email_address",     limit: 50
    t.string   "phone_number",      limit: 45
    t.integer  "user_id"
    t.index ["address_id"], name: "FK_Person_Address", using: :btree
  end

  create_table "property", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.bigint   "address_id",                                     null: false
    t.text     "description",       limit: 65535,                             collation: "utf8_general_ci"
    t.integer  "property_type"
    t.datetime "property_date"
    t.integer  "number_of_rooms"
    t.string   "area_size",         limit: 50,                                collation: "utf8_general_ci"
    t.decimal  "per_unit_price",                  precision: 18
    t.integer  "property_status"
    t.integer  "number_of_baths"
    t.string   "short_description", limit: 150
    t.string   "property_number",   limit: 45
    t.index ["address_id"], name: "FK_Property_Address", using: :btree
  end

  create_table "property_price", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "property_id",                             null: false
    t.decimal  "per_unit_price", precision: 18, scale: 2, null: false
    t.integer  "price_status",                            null: false
    t.datetime "price_date",                              null: false
    t.datetime "price_end_date"
    t.decimal  "down_payment",   precision: 10
    t.integer  "mortgage_term"
    t.integer  "interest_rate"
  end

  create_table "property_rating", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "property_id"
    t.integer "user_id"
    t.integer "rating"
    t.date    "rating_date"
  end

  create_table "property_search", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "number_of_rooms"
    t.integer  "number_of_baths"
    t.decimal  "price_range_start",            precision: 10
    t.decimal  "price_range_end",              precision: 10
    t.integer  "user_id"
    t.datetime "search_date"
    t.integer  "address_id"
    t.string   "property_number",   limit: 45
    t.string   "is_interest",       limit: 3
  end

  create_table "property_tag", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "property_id"
    t.integer "tag_id"
    t.date    "tag_date"
  end

  create_table "property_valuation", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "property_id"
    t.string   "instructions",          limit: 450
    t.string   "site_area",             limit: 45
    t.string   "zoning",                limit: 45
    t.string   "comments",              limit: 450
    t.string   "terms_of_reference",    limit: 1000
    t.datetime "date_of_inspection"
    t.datetime "date_of_valuation"
    t.string   "land_value",            limit: 45
    t.string   "improvements",          limit: 45
    t.string   "market_valuation",      limit: 250
    t.string   "registered_proprietor", limit: 150
    t.string   "land_dimensions",       limit: 250
    t.string   "land_area",             limit: 45
    t.string   "encumberances",         limit: 2500
    t.string   "topography",            limit: 250
    t.string   "services",              limit: 250
    t.string   "environmental_issues",  limit: 2500
    t.string   "location",              limit: 2500
    t.string   "dwelling_description",  limit: 450
    t.string   "construction",          limit: 450
    t.string   "accomodation",          limit: 450
    t.string   "pc_items",              limit: 450
    t.string   "fixtures_features",     limit: 450
    t.string   "other_improvements",    limit: 450
    t.string   "building_areas",        limit: 450
  end

  create_table "room", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.bigint "property_id",            null: false
    t.string "room_name",   limit: 50
    t.string "area",        limit: 50
    t.string "unique_Id",   limit: 50
  end

  create_table "seller", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.bigint "person_id",   null: false
    t.bigint "property_id", null: false
  end

  create_table "staff", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.bigint  "person_id", null: false
    t.integer "status",    null: false
    t.index ["person_id"], name: "FK_Staff_Person", using: :btree
  end

  create_table "tag", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", limit: 150
  end

  create_table "user", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email_address", limit: 50
    t.text   "password",      limit: 65535
    t.date   "created_date"
    t.text   "salt",          limit: 65535
    t.string "role",          limit: 45
  end

  add_foreign_key "buyer", "person", name: "FK_Buyer_Person"
  add_foreign_key "buyer", "property", name: "FK_Buyer_Property"
  add_foreign_key "feature", "property", name: "FK_Feature_Property"
  add_foreign_key "person", "address", name: "FK_Person_Address"
  add_foreign_key "room", "property", column: "id", name: "FK_Room_Property"
  add_foreign_key "staff", "person", name: "FK_Staff_Person"
end
