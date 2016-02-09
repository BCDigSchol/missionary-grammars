class LinkAlternateDesignationToLanguage < ActiveRecord::Migration
  def change
    change_table :alternate_designations do |t|
      t.integer :language_id
    end
    add_foreign_key :alternate_designations, :languages
  end
end
