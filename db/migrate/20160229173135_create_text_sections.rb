class CreateTextSections < ActiveRecord::Migration
  def change
    create_table :text_sections do |t|
      t.string :title
      t.integer :from
      t.integer :to
      t.integer :ordinal
      t.timestamps null: false
    end

    add_reference :text_sections, :parent, index: true, foreign_key: 'parent'
    add_reference :text_sections, :text, index: true, foreign_key: true
  end
end
