class MapImage < ApplicationRecord
  mount_uploader :image, MapImageUploader

  belongs_to :website

  after_update_commit :update_map_image

  def image_real_url
    image.url.split("/").last(4).join("/")
  end

  private

  def update_map_image
    Dir.chdir("#{Rails.root.parent}/projects/#{website.repo.path}")
    pages = website.pages
    page = pages.find{ |p| p.name == page_name}
    url = page.url
    html = Nokogiri.HTML(File.read(url))
    html.css(parent_div)[order]["src"] = image_real_url
    html.css(parent_div)[order]["alt"] = website.name + " - " + element_name
    File.write(url, html)
  end
end
