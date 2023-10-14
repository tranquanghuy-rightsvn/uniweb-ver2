class Category < ApplicationRecord
  belongs_to :website
  has_many :posts
  has_many :products

  validates :name, presence: true
  enum category_type: { product: 1, post: 2 }

  def self.generate_options(website_id, type)
    Category.where(website_id: website_id, category_type: type).pluck(:name, :id)
  end
end
