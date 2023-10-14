class Post < ApplicationRecord
  include RenderHtml

  mount_uploader :image, PostUploader
  has_rich_text :content

  belongs_to :website
  belongs_to :category, optional: true
  validates :url, presence: true, uniqueness: { scope: :website_id }

  after_create_commit :create_file
  after_update_commit :update_file
  after_destroy_commit :destroy_file

  def image_real_url
    image_url.split("/").last(4).join("/")
  end

  def real_content
    "<div class=\"container\"><div class=\"box-content\"><i>" + time_publish + "</i> <br><br><h1>"+ title + "</h1><div class=\"content\">" + content.body.to_s.gsub(/<action-text-attachment[^>]*>[^<]*<\/action-text-attachment>/, '') +"</div></div></div></div>"
  end

  def time_publish
    "Đăng lúc #{(created_at + 7 *3600).strftime("%H:%M %d/%m/%Y")}"
  end

  private

  def create_file
    Dir.chdir("#{Rails.root.parent}/projects/#{website.repo.path}")
    maps = website.maps.where(map_type: 2)
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

    content_post = RenderHtml.render_post website, self

    File.write(url, content_post)
    File.write('sitemaps.xml', sitemap_xml)
  end

  def update_file
  end

  def destroy_file
  end
end

