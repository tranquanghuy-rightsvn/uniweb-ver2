class CreateStores < ActiveRecord::Migration[6.1]
  def change
    create_table :stores do |t|
      t.references :website
      t.string :provinces, null: false, default: '[]'
      t.integer :inner_province
      t.integer :outer_province

      t.timestamps
    end
  end
end
