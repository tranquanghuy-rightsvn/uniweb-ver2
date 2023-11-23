class CreateGoogleApiCredentials < ActiveRecord::Migration[6.1]
  def change
    create_table :google_api_credentials do |t|
      t.string :project_id
      t.string :private_key_id
      t.text :private_key
      t.string :client_email
      t.string :client_id
      t.string :client_cert_url
      t.integer :property_id
      t.json :number_of_views
      t.json :top_posts
      t.json :top_countries
      t.references :website

      t.timestamps
    end
  end
end
