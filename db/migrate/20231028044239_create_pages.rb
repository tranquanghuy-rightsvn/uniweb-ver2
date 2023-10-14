class CreatePages < ActiveRecord::Migration[6.1]
  def change
    create_table :pages do |t|
      t.text :html
      t.string :url
      t.string :name
      t.references :website

      t.timestamps
    end
  end
end
