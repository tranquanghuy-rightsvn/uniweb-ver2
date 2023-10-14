class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :category_type
      t.boolean :editable, default: true
      t.references :website

      t.timestamps
    end
  end
end
