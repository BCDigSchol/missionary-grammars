class CreateTextCategories < ActiveRecord::Migration
  def change
    create_table :text_categories do |t|

      t.timestamps null: false
    end
  end
end
