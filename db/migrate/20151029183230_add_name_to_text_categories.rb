class AddNameToTextCategories < ActiveRecord::Migration
  def change
    add_column :text_categories, :name, :string
  end
end
