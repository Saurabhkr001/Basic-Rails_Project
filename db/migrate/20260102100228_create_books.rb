class CreateBooks < ActiveRecord::Migration[8.1]
  def change
    create_table :books do |t|
      t.string :author
      t.text :description
      t.decimal :price

      t.timestamps
    end
  end
end
