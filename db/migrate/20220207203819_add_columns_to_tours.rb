class AddColumnsToTours < ActiveRecord::Migration[6.1]
  def change
    add_column :tours, :services, :text
    add_column :tours, :departure, :text
    add_column :tours, :expectation, :text
    add_column :tours, :additional_info, :text
    add_column :tours, :cancellation, :text
    add_column :tours, :faq, :text
  end
end
