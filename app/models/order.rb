class Order < ApplicationRecord
  belongs_to :store
  has_many :order_products
  has_many :products, through: :order_products

  enum status: { new_order: 0, confirming_paid: 1, paid: 2, deliver: 3, completed: 4, rejected: 5}

  validates :order_code, :province, :address, :phone_number, presence: true

  def formated_total_price
    total_price.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1.').reverse
  end
end
