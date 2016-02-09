class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.text :designation
      t.text :status

      t.timestamps null: false
    end
  end
end
