class AddCoverImageToTexts < ActiveRecord::Migration
  def change
    add_column :texts, :cover_image, :string
  end
end
