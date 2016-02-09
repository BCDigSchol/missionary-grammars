class AddDetailsToTexts < ActiveRecord::Migration
  def change
    change_table :texts do |t|
      t.string :language_name
    end

    end
end
