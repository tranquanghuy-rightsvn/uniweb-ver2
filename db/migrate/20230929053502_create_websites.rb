class CreateWebsites < ActiveRecord::Migration[6.1]
  def change
    create_table :websites do |t|
      t.string :name
      t.string :domain_vercel
      t.string :domain_website
      t.string :title
      t.string :description
      t.string :province
      t.string :logo
      t.string :icon
      t.string :resources

      t.timestamps
    end
  end
end
