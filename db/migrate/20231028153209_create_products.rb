class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.text :description

      t.references :user
      t.references :website, null: false
      t.references :category

      t.timestamps
    end
  end
end
