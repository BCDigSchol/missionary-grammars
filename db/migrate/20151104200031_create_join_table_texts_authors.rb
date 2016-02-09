class CreateJoinTableTextsAuthors < ActiveRecord::Migration
  def change
    create_join_table :languages, :texts do |t|
      t.index [:language_id, :text_id]
      t.index [:text_id, :language_id]
    end
  end
end
