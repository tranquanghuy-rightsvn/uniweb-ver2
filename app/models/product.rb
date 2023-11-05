class Product < ApplicationRecord
  belongs_to :website
  belongs_to :category, optional: true # sẽ bỏ optional trong tương lai
  has_many :product_images, inverse_of: :product
  has_rich_text :content

  validates :url, presence: true, uniqueness: { scope: :website_id }

  validate :must_have_image

  accepts_nested_attributes_for :product_images

  after_create_commit :create_file
  after_update_commit :update_file
  after_destroy_commit :destroy_file

  def real_content
    content.body.to_s.gsub(/<action-text-attachment[^>]*>[^<]*<\/action-text-attachment>/, '')
  end

  private

  def create_file
    Dir.chdir("#{Rails.root.parent}/projects/#{website.repo.path}")
    maps = website.maps.where(map_type: 1)
    pages = website.pages

    sitemap_xml = Nokogiri::XML(File.read('sitemaps.xml'))
    urlset_sitemap_xml = sitemap_xml.at_css('urlset')
    urlset_sitemap_xml.inner_html += "<url><loc>" + website.real_domain + url + "</loc><changefreq>yearly</changefreq><priority>0.9</priority></url>"

    maps.map do |map|
      map_url = pages.find{|p| p.name == map.page_name}.url
      next if map.category_name.present? && map.category_name != category&.name

      html = Nokogiri.HTML(File.read(map_url))
      html.at_css(map.parent_div).inner_html = RenderHtml.send("render_#{map.template_name.gsub('-', '_')}", website.id, map, self)

      File.write(map_url, html)
    end

    content_post = RenderHtml.render_product website, self

    File.write(url, content_post)
    File.write('sitemaps.xml', sitemap_xml)
  end


  def must_have_image
    errors.add(:base, "Phải có ít nhất 1 ảnh") if product_images.blank?
  end
end
