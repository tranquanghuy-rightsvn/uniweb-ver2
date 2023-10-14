class Map < ApplicationRecord
  belongs_to :website

  enum map_type: { product: 1, post: 2 }
  enum variant: { newest: 1, category: 2 }
end
