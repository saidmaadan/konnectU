class AddSlugToTask < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :slug, :string
    add_index :tasks, :slug, unique: true
  end
end
