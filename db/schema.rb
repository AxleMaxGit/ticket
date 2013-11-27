ActiveRecord::Schema.define(version: 20131127002248) do

  create_table "bids", force: true do |t|
    t.integer  "price"
    t.string   "bidder"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", force: true do |t|
    t.string   "name"
    t.integer  "postcode"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.string   "eventname"
    t.string   "eventtype"
    t.string   "location"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "eventtypes", force: true do |t|
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: true do |t|
    t.string   "place"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tixes", force: true do |t|
    t.string   "eventname"
    t.string   "eventtype"
    t.string   "location"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
