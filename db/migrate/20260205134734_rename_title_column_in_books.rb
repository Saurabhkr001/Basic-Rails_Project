class RenameTitleColumnInBooks < ActiveRecord::Migration[8.1]
  def change
    rename_column :books, :Title, :title
  end
end
