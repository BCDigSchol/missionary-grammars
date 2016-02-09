class AddLinkToLanguagesOrthographies < ActiveRecord::Migration
  def change
    add_foreign_key :languages_orthographies, :languages
    add_foreign_key :languages_orthographies, :orthographies
  end
end
