class AddTitleToTexts < ActiveRecord::Migration
  def change

    change_table :texts do |t|
      t.string :title
      t.rename :edition_node, :edition_note
    end

    create_join_table :texts, :authors do |t|
      t.index :text_id
      t.index :author_id
    end

  end
end
