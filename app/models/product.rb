class Product < ApplicationRecord
  belongs_to :website
  belongs_to :category, optional: true # sẽ bỏ optional trong tương lai
  has_many :product_images

  validates :url, presence: true, uniqueness: { scope: :website_id }
end
