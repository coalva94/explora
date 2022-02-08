class AddLongitudeToTours < ActiveRecord::Migration[6.1]
  def change
    add_column :tours, :longitude, :float
  end
end
