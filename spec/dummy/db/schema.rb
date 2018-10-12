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

ActiveRecord::Schema.define(version: 20_181_012_133_312) do
  create_table 'mercadolibre_rails_pictures', force: :cascade do |t|
    t.string 'url', null: false
    t.integer 'product_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['product_id'], name: 'index_mercadolibre_rails_pictures_on_product_id'
    t.index ['url'], name: 'index_mercadolibre_rails_pictures_on_url', unique: true
  end

  create_table 'mercadolibre_rails_products', force: :cascade do |t|
    t.string 'mercadolibre_id', null: false
    t.string 'title'
    t.decimal 'price', precision: 8, scale: 2
    t.string 'currency_code'
    t.integer 'sold_quantity', default: 0
    t.text 'description'
    t.string 'status', default: 'sync_needed'
    t.decimal 'latitude', precision: 10, scale: 6
    t.decimal 'longitude', precision: 10, scale: 6
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'site_id'
    t.integer 'seller_id'
    t.index ['mercadolibre_id'], name: 'index_mercadolibre_rails_products_on_mercadolibre_id', unique: true
    t.index ['seller_id'], name: 'index_mercadolibre_rails_products_on_seller_id'
    t.index ['site_id'], name: 'index_mercadolibre_rails_products_on_site_id'
  end

  create_table 'mercadolibre_rails_sellers', force: :cascade do |t|
    t.integer 'mercadolibre_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['mercadolibre_id'], name: 'index_mercadolibre_rails_sellers_on_mercadolibre_id', unique: true
  end

  create_table 'mercadolibre_rails_sites', force: :cascade do |t|
    t.string 'code', null: false
    t.boolean 'active', default: true
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['code'], name: 'index_mercadolibre_rails_sites_on_code', unique: true
  end

  create_table 'mercadolibre_rails_versions', force: :cascade do |t|
    t.string 'item_type', null: false
    t.integer 'item_id', null: false
    t.string 'event', null: false
    t.string 'whodunnit'
    t.text 'object', limit: 1_073_741_823
    t.datetime 'created_at'
    t.text 'object_changes', limit: 1_073_741_823
    t.index %w[item_type item_id], name: 'index_mercadolibre_rails_versions_on_item_type_and_item_id'
  end
end
