class CreateMaps < ActiveRecord::Migration[6.1]
  def change
    create_table :maps do |t|
      t.integer :map_type
      t.integer :variant
      t.string :template_name
      t.string :parent_div
      t.string :page_name
      t.string :category_name
      t.integer :limit_item

      t.references :website

      t.timestamps
    end
  end
end
