class CreateCompanions < ActiveRecord::Migration[6.1]
  def change
    create_table :companions do |t|
      t.string :first_name
      t.string :last_name
      t.string :age
      t.string :document_number
      t.references :booking, null: false, foreign_key: true

      t.timestamps
    end
  end
end
