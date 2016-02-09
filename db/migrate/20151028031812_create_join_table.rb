class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :languages, :orthographies do |t|
      t.index [:language_id, :orthography_id], :name => "index_lang_orth"
      t.index [:orthography_id, :language_id], :name => "index_orth_lang"
    end
  end
end
