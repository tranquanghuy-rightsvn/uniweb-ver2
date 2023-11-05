class CreateMapImages < ActiveRecord::Migration[6.1]
  def change
    create_table :map_images do |t|
      t.string :image
      t.references :website
      t.string :element_name
      t.string :parent_div
      t.string :page_name
      t.integer :order

      t.timestamps
    end
  end
end
