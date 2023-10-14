class CreateProductImages < ActiveRecord::Migration[6.1]
  def change
    create_table :product_images do |t|
      t.string :image
      t.references :product

      t.timestamps
    end
  end
end
