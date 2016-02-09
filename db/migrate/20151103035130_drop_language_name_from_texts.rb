class DropLanguageNameFromTexts < ActiveRecord::Migration
  def change
    remove_column :texts, :language_name
  end
end
