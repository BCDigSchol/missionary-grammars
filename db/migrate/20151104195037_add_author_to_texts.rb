class AddAuthorToTexts < ActiveRecord::Migration
  def change
    add_column :texts, :author_id, :integer
    add_foreign_key :texts, :authors
  end
end
