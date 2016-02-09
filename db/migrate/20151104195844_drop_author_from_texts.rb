class DropAuthorFromTexts < ActiveRecord::Migration
  def change
    remove_column :texts, :author_id
  end
end
