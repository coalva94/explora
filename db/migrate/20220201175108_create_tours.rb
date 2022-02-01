class CreateTours < ActiveRecord::Migration[6.1]
  def change
    create_table :tours do |t|
      t.float :price
      t.string :destination
      t.string :title_tour
      t.text :description
      t.string :duration
      t.references :agency, null: false, foreign_key: true

      t.timestamps
    end
  end
end
