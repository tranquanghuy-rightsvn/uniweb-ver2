class Store < ApplicationRecord
  belongs_to :website
  has_many :banks
  has_many :orders

  after_update_commit :update_cart_html

  private

  def update_cart_html
    Dir.chdir("#{Rails.root.parent}/projects/#{website.repo.path}")
    cart_html = Nokogiri.HTML(File.read('cart.html'))
    store_information = cart_html.at_css('#store-information')
    store_information['data-provinces'] = provinces
    store_information['data-inner-province'] = inner_province
    store_information['data-outer-province'] = outer_province

    File.write('cart.html', cart_html)
  end
end
