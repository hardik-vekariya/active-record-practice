# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 20_240_207_112_801) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'authors', force: :cascade do |t|
    t.string 'first_name'
    t.string 'last_name'
    t.string 'title'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'books', force: :cascade do |t|
    t.string 'title'
    t.integer 'year_published'
    t.string 'isbn'
    t.decimal 'price'
    t.boolean 'out_of_print'
    t.integer 'views'
    t.bigint 'supplier_id', null: false
    t.bigint 'author_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['author_id'], name: 'index_books_on_author_id'
    t.index ['supplier_id'], name: 'index_books_on_supplier_id'
  end

  create_table 'books_orders', id: false, force: :cascade do |t|
    t.bigint 'book_id', null: false
    t.bigint 'order_id', null: false
  end

  create_table 'customers', force: :cascade do |t|
    t.string 'first_name'
    t.string 'last_name'
    t.string 'title'
    t.string 'email'
    t.integer 'visits'
    t.integer 'order_count'
    t.integer 'lock_version'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'orders', force: :cascade do |t|
    t.datetime 'date_submitted'
    t.integer 'status'
    t.decimal 'subtotal'
    t.decimal 'shipping'
    t.decimal 'tax'
    t.decimal 'total'
    t.bigint 'customer_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['customer_id'], name: 'index_orders_on_customer_id'
  end

  create_table 'reviews', force: :cascade do |t|
    t.string 'title'
    t.text 'body'
    t.integer 'rating'
    t.integer 'state'
    t.bigint 'customer_id', null: false
    t.bigint 'book_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['book_id'], name: 'index_reviews_on_book_id'
    t.index ['customer_id'], name: 'index_reviews_on_customer_id'
  end

  create_table 'suppliers', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key 'books', 'authors'
  add_foreign_key 'books', 'suppliers'
  add_foreign_key 'orders', 'customers'
  add_foreign_key 'reviews', 'books'
  add_foreign_key 'reviews', 'customers'
end
