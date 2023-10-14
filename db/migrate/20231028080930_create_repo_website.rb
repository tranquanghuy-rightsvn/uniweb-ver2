class CreateRepoWebsite < ActiveRecord::Migration[6.1]
  def change
    create_table :repo_websites do |t|
      t.references :repo
      t.references :website

      t.timestamps
    end
  end
end
