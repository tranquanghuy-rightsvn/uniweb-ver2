class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :description
      t.string :url
      t.string :image
      t.string :refer_ids, default: "[]"

      t.references :category
      t.references :user
      t.references :website, null: false

      t.timestamps
    end
  end
end
