# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160122035554) do

  create_table "alternate_designations", force: :cascade do |t|
    t.string   "designation"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "language_id"
  end

  create_table "authors", force: :cascade do |t|
    t.string   "first"
    t.string   "last"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "authors_texts", id: false, force: :cascade do |t|
    t.integer "text_id",   null: false
    t.integer "author_id", null: false
  end

  add_index "authors_texts", ["author_id"], name: "index_authors_texts_on_author_id"
  add_index "authors_texts", ["text_id"], name: "index_authors_texts_on_text_id"

  create_table "languages", force: :cascade do |t|
    t.text     "designation"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.text     "location"
    t.string   "iso"
    t.string   "status"
    t.string   "orthography"
    t.string   "macro_classification"
    t.string   "glottocode"
    t.decimal  "latitude",             precision: 5, scale: 2
    t.decimal  "longitude",            precision: 5, scale: 2
  end

  add_index "languages", ["glottocode"], name: "index_languages_on_glottocode"
  add_index "languages", ["iso"], name: "index_languages_on_iso"
  add_index "languages", ["location"], name: "index_languages_on_location"
  add_index "languages", ["macro_classification"], name: "index_languages_on_macro_classification"
  add_index "languages", ["orthography"], name: "index_languages_on_orthography"
  add_index "languages", ["status"], name: "index_languages_on_status"

  create_table "languages_orthographies", id: false, force: :cascade do |t|
    t.integer "language_id",    null: false
    t.integer "orthography_id", null: false
  end

  add_index "languages_orthographies", ["language_id", "orthography_id"], name: "index_lang_orth"
  add_index "languages_orthographies", ["orthography_id", "language_id"], name: "index_orth_lang"

  create_table "languages_texts", id: false, force: :cascade do |t|
    t.integer "language_id", null: false
    t.integer "text_id",     null: false
  end

  add_index "languages_texts", ["language_id", "text_id"], name: "index_languages_texts_on_language_id_and_text_id"
  add_index "languages_texts", ["text_id", "language_id"], name: "index_languages_texts_on_text_id_and_language_id"

  create_table "missionary_groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orthographies", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "publishers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "publishers_texts", id: false, force: :cascade do |t|
    t.integer "text_id",      null: false
    t.integer "publisher_id", null: false
  end

  add_index "publishers_texts", ["publisher_id", "text_id"], name: "index_publishers_texts_on_publisher_id_and_text_id"
  add_index "publishers_texts", ["text_id", "publisher_id"], name: "index_publishers_texts_on_text_id_and_publisher_id"

  create_table "text_categories", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  create_table "texts", force: :cascade do |t|
    t.integer  "missionary_group_id"
    t.integer  "publication_year"
    t.text     "edition_note"
    t.string   "publication_place"
    t.string   "holding_library"
    t.string   "holding_details"
    t.string   "digital_copy_url"
    t.string   "hathi_url"
    t.string   "google_url"
    t.integer  "text_categories_id"
    t.boolean  "by_same_author_flag"
    t.boolean  "preface_flag"
    t.boolean  "foreward_flag"
    t.boolean  "table_of_prefixes_flag"
    t.boolean  "introduction_flag"
    t.boolean  "alphabet_flag"
    t.boolean  "orthography_flag"
    t.boolean  "notize_flag"
    t.boolean  "prounciation_flag"
    t.boolean  "orthography_and_pronunciation_flag"
    t.boolean  "observations_flag"
    t.boolean  "grammatical_sketch_flag"
    t.boolean  "grammar_summary_flag"
    t.boolean  "rules_of_language_flag"
    t.boolean  "phrase_collection_flag"
    t.boolean  "signs_and_abbreviations_flag"
    t.boolean  "abbreviations_flag"
    t.boolean  "sodality_flag"
    t.boolean  "bulletin_flag"
    t.boolean  "proper_names_flag"
    t.boolean  "appendix_flag"
    t.boolean  "addenda_flag"
    t.boolean  "contents_flag"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "title"
  end

end
