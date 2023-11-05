class Map < ApplicationRecord
  belongs_to :website

  has_many :map_images

  enum map_type: { product: 1, post: 2 }
  enum variant: { newest: 1, category: 2 }
end
