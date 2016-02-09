class AddDetailsToLanguages < ActiveRecord::Migration
  def change
    remove_column :languages, :status
    add_column :languages, :location, :text
    add_index :languages, :location
    add_column :languages, :iso, :string
    add_index :languages, :iso
    add_column :languages, :status, :string
    add_index :languages, :status
    add_column :languages, :orthography, :string
    add_index :languages, :orthography
    add_column :languages, :macro_classification, :string
    add_index :languages, :macro_classification
    add_column :languages, :glottocode, :string
    add_index :languages, :glottocode
    add_column :languages, :latitude, :decimal, precision: 3, scale: 2
    add_column :languages, :longitude, :decimal, precision: 3, scale: 2
  end
end
