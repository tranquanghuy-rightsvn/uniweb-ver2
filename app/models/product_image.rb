class ProductImage < ApplicationRecord
  mount_uploader :image, ProductImageUploader

  belongs_to :product

  def image_real_url
    image.url.split("/").last(4).join("/")
  end
end
