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

ActiveRecord::Schema.define(version: 2019_03_04_065233) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "golongans", force: :cascade do |t|
    t.string "golongan_obat"
    t.string "lokasi"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "obats", force: :cascade do |t|
    t.string "nama_obat"
    t.integer "qty"
    t.integer "harga"
    t.bigint "golongan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["golongan_id"], name: "index_obats_on_golongan_id"
  end

  create_table "penjualans", force: :cascade do |t|
    t.string "nama_konsumen"
    t.string "no_hp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transaksis", force: :cascade do |t|
    t.date "tgl"
    t.integer "qty_beli"
    t.bigint "obat_id"
    t.bigint "penjualan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["obat_id"], name: "index_transaksis_on_obat_id"
    t.index ["penjualan_id"], name: "index_transaksis_on_penjualan_id"
  end

  add_foreign_key "obats", "golongans"
  add_foreign_key "transaksis", "obats"
  add_foreign_key "transaksis", "penjualans"
end
