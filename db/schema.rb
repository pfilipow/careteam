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

ActiveRecord::Schema.define(version: 20171004050919) do

  create_table "articles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "blog_id"
    t.text     "title",      limit: 65535
    t.text     "content",    limit: 65535
    t.integer  "author_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["author_id"], name: "index_articles_on_author_id", using: :btree
    t.index ["blog_id"], name: "index_articles_on_blog_id", using: :btree
  end

  create_table "blogs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "domain"
    t.text     "title",       limit: 65535
    t.text     "description", limit: 65535
    t.integer  "owner_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["owner_id"], name: "index_blogs_on_owner_id", using: :btree
  end

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "article_id"
    t.text     "author",     limit: 65535
    t.text     "content",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["article_id"], name: "index_comments_on_article_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email"
    t.text     "name",       limit: 65535
    t.text     "bio",        limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_foreign_key "articles", "blogs"
  add_foreign_key "comments", "articles"
end
