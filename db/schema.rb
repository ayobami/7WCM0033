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

ActiveRecord::Schema.define(version: 20170217221230) do

  create_table "address", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string  "street1",      limit: 250
    t.string  "street2",      limit: 250
    t.string  "city",         limit: 250
    t.string  "state",        limit: 250
    t.integer "country"
    t.string  "zip_code",     limit: 50
    t.string  "plot_number",  limit: 50
    t.string  "floor_number", limit: 50
  end

  create_table "buyer", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.bigint  "person_id",                  null: false
    t.bigint  "property_id",                null: false
    t.decimal "min_budget",  precision: 18
    t.decimal "max_budget",  precision: 18
    t.index ["person_id"], name: "FK_Buyer_Person", using: :btree
    t.index ["property_id"], name: "FK_Buyer_Property", using: :btree
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
    t.string "file_path",       limit: 250, null: false
    t.string "extension",       limit: 10,  null: false
    t.string "title",           limit: 100
    t.bigint "size",                        null: false
    t.string "owner_unique_id", limit: 150
  end

  create_table "lease", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.bigint "property_id", null: false
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

  create_table "property", primary_key: "PropertyId", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.bigint   "AddressId",                                  null: false
    t.text     "Description",   limit: 65535
    t.integer  "PropertyType"
    t.datetime "PropertyDate"
    t.integer  "NumberOfRooms"
    t.string   "AreaSize",      limit: 50
    t.decimal  "PerUnitPrice",                precision: 18
    t.index ["AddressId"], name: "FK_Property_Address", using: :btree
  end

  create_table "property_rating", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "property_id"
    t.integer "user_id"
    t.integer "rating"
    t.date    "rating_date"
  end

  create_table "property_tag", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "property_id"
    t.integer "tag_id"
    t.date    "tag_date"
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
  end

  add_foreign_key "buyer", "person", name: "FK_Buyer_Person"
  add_foreign_key "buyer", "property", primary_key: "PropertyId", name: "FK_Buyer_Property"
  add_foreign_key "feature", "property", primary_key: "PropertyId", name: "FK_Feature_Property"
  add_foreign_key "person", "address", name: "FK_Person_Address"
  add_foreign_key "property", "address", column: "AddressId", name: "FK_Property_Address"
  add_foreign_key "room", "property", column: "id", primary_key: "PropertyId", name: "FK_Room_Property"
  add_foreign_key "staff", "person", name: "FK_Staff_Person"
end
