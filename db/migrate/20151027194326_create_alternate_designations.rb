class CreateAlternateDesignations < ActiveRecord::Migration
  def change
    create_table :alternate_designations do |t|
      t.string :designation

      t.timestamps null: false
    end
  end
end
