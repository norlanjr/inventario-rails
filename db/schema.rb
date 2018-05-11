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

ActiveRecord::Schema.define(version: 20180507232508) do

  create_table "articles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre"
    t.string "descripcion"
    t.decimal "precio", precision: 10
    t.decimal "precio2", precision: 10
    t.decimal "costo", precision: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "state", default: "in_draft"
    t.decimal "ganancia", precision: 8, scale: 2
    t.index ["user_id"], name: "index_articles_on_user_id"
  end

  create_table "bills", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.bigint "client_id"
    t.string "estado"
    t.decimal "total", precision: 10
    t.decimal "saldo", precision: 10
    t.datetime "fecha_limite"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_bills_on_client_id"
    t.index ["user_id"], name: "index_bills_on_user_id"
  end

  create_table "clients", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre"
    t.string "cedula"
    t.integer "telefono"
    t.string "direccion"
    t.decimal "credito", precision: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "deuda", precision: 10
  end

  create_table "detail_invoices", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "bill_id"
    t.bigint "article_id"
    t.decimal "cantidad", precision: 10
    t.decimal "sub_total", precision: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_detail_invoices_on_article_id"
    t.index ["bill_id"], name: "index_detail_invoices_on_bill_id"
  end

  create_table "details", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "article_id"
    t.decimal "cantidad", precision: 10
    t.decimal "precio", precision: 10
    t.decimal "descuneto", precision: 10
    t.decimal "sub_total", precision: 10
    t.decimal "total", precision: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "entry_id"
    t.index ["article_id"], name: "index_details_on_article_id"
    t.index ["entry_id"], name: "index_details_on_entry_id"
  end

  create_table "entries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.bigint "provider_id"
    t.decimal "total", precision: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provider_id"], name: "index_entries_on_provider_id"
    t.index ["user_id"], name: "index_entries_on_user_id"
  end

  create_table "payments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "bill_id"
    t.decimal "cantidad", precision: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bill_id"], name: "index_payments_on_bill_id"
  end

  create_table "providers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre"
    t.integer "telefono"
    t.string "empresa"
    t.string "ruc_empresa"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purchase_details", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "purchase_id"
    t.bigint "article_id"
    t.decimal "cantidad", precision: 10
    t.decimal "sub_total", precision: 10
    t.decimal "total", precision: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_purchase_details_on_article_id"
    t.index ["purchase_id"], name: "index_purchase_details_on_purchase_id"
  end

  create_table "purchases", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "provider_id"
    t.decimal "total", precision: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provider_id"], name: "index_purchases_on_provider_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "permission_level", default: 1
    t.string "nombre"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "articles", "users"
  add_foreign_key "bills", "clients"
  add_foreign_key "bills", "users"
  add_foreign_key "detail_invoices", "articles"
  add_foreign_key "detail_invoices", "bills"
  add_foreign_key "details", "articles"
  add_foreign_key "details", "entries"
  add_foreign_key "entries", "providers"
  add_foreign_key "entries", "users"
  add_foreign_key "payments", "bills"
  add_foreign_key "purchase_details", "articles"
  add_foreign_key "purchase_details", "purchases"
  add_foreign_key "purchases", "providers"
end
