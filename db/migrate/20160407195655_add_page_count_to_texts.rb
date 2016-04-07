class AddPageCountToTexts < ActiveRecord::Migration
  def change
    add_column :texts, :pages, :integer
  end
end
