class CreateOrthographies < ActiveRecord::Migration
  def change
    create_table :orthographies do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
