class CreateMissionaryGroups < ActiveRecord::Migration
  def change
    create_table :missionary_groups do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
