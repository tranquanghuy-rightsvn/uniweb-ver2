class CreateBanks < ActiveRecord::Migration[6.1]
  def change
    create_table :banks do |t|
      t.references :store
      t.string :qr_code
      t.string :bank_name
      t.string :account_name
      t.string :account_number
      t.string :account_branch

      t.timestamps
    end
  end
end
