class AddLatitudeToTours < ActiveRecord::Migration[6.1]
  def change
    add_column :tours, :latitude, :float
  end
end
