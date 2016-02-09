class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :languages, :orthographies do |t|
      t.index [:language_id, :orthography_id]
      t.index [:orthography_id, :language_id]
    end
  end
end
