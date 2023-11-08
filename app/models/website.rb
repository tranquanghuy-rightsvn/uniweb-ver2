class Website < ApplicationRecord
  mount_uploader :logo, WebsiteLogoUploader
  mount_uploader :icon, WebsiteIconUploader

  include RenderHtml

  has_many :products
  has_many :posts
  has_many :pages
  has_many :maps
  has_many :categories

  has_many :user_website_managers, -> { where(role: 0) }, class_name: 'UserWebsiteRole'
  has_many :managers, through: :user_website_managers, source: :user

  has_one :user_website_owner, -> { where(role: 1) }, class_name: 'UserWebsiteRole'
  has_one :owner, through: :user_website_owner, source: :user

  has_many :user_website_roles
  has_many :website_images
  has_many :map_images

  has_one :repo_website
  has_one :repo, through: :repo_website

  after_create :generate_folder

  def menu
    Nokogiri.HTML(pages.first.html).at_css('nav').to_s.gsub("opacity-menu", "")
  end

  def footer
    Nokogiri.HTML(pages.first.html).at_css('.footer').to_s
  end

  def real_domain
    domain = domain_website || repo.vercel_domain
    "https://www." + domain + "/"
  end

  private

  def generate_folder
    Dir.chdir("#{Rails.root.parent}/projects/#{repo.path}")
    sitemap_xml = Nokogiri::XML(File.read('sitemaps.xml'))
    urlset_sitemap_xml = sitemap_xml.at_css('urlset')

    pages.map do |page|
      if maps.pluck(:page_name).include?(page.name)
        page_maps = maps.select{|m| m.page_name == page.name}
        html = Nokogiri.HTML(page.html)
        page_maps.map do |map|
          html.at_css(map.parent_div).inner_html = ''
        end

        page.html = html
      end

      content = RenderHtml.render_default(self, page)
      urlset_sitemap_xml.inner_html += "<url><loc>" + real_domain + page.url + "</loc><changefreq>yearly</changefreq><priority>0.9</priority></url>"

      File.write(page.url, content)
    end

    File.write('search.html', RenderHtml.render_search_page(self))

    File.write('sitemaps.xml', sitemap_xml)
  end
end
