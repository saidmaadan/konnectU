class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :content
      t.integer :price

      t.timestamps
    end
  end
end
