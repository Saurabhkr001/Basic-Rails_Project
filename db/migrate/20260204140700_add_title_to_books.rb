class AddTitleToBooks < ActiveRecord::Migration[8.1]
  def change
    add_column :books, :Title, :string
  end
end
