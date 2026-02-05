class AddPublishedDateToBooks < ActiveRecord::Migration[8.1]
  def change
    add_column :books, :Published_on, :date
  end
end
