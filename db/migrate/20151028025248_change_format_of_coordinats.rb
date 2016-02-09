class ChangeFormatOfCoordinats < ActiveRecord::Migration
  def change
    change_column :languages, :latitude, :decimal, precision: 5, scale: 2
    change_column :languages, :longitude, :decimal, precision: 5, scale: 2
  end
end
