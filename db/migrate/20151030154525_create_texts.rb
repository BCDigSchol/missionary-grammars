class CreateTexts < ActiveRecord::Migration
  def change
    create_table :texts do |t|
      t.references :missionary_group
      t.integer :publication_year
      t.text :edition_node
      t.string :publication_place
      t.references :publisher
      t.string :holding_library
      t.string :holding_details
      t.string :digital_copy_url
      t.string :hathi_url
      t.string :google_url
      t.references :text_categories
      t.boolean :by_same_author_flag
      t.boolean :preface_flag
      t.boolean :foreward_flag
      t.boolean :table_of_prefixes_flag
      t.boolean :introduction_flag
      t.boolean :alphabet_flag
      t.boolean :orthography_flag
      t.boolean :notize_flag
      t.boolean :prounciation_flag
      t.boolean :orthography_and_pronunciation_flag
      t.boolean :observations_flag
      t.boolean :grammatical_sketch_flag
      t.boolean :grammar_summary_flag
      t.boolean :rules_of_language_flag
      t.boolean :phrase_collection_flag
      t.boolean :signs_and_abbreviations_flag
      t.boolean :abbreviations_flag
      t.boolean :sodality_flag
      t.boolean :bulletin_flag
      t.boolean :proper_names_flag
      t.boolean :appendix_flag
      t.boolean :addenda_flag
      t.boolean :contents_flag

      t.timestamps null: false
    end
  end
end
