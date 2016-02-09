class MakePublishersManyToMany < ActiveRecord::Migration
  def change
    remove_column :texts, :publisher_id

    create_join_table :texts, :publishers do |t|
      t.index [:text_id, :publisher_id]
      t.index [:publisher_id, :text_id]
    end
  end
end
