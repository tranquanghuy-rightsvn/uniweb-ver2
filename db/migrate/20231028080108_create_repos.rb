class CreateRepos < ActiveRecord::Migration[6.1]
  def change
    create_table :repos do |t|
      t.string :path
      t.string :vercel_domain
      t.string :git_remote
      t.boolean :is_available, null: false, default: true

      t.timestamps
    end
  end
end
