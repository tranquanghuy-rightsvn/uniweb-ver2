class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :order_code
      t.string :province
      t.integer :status, null: false, default: 0
      t.string :address
      t.string :phone_number
      t.text :note
      t.integer :total_price
      t.references :store

      t.timestamps
    end
  end
end
