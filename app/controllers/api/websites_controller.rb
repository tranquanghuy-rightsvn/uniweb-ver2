module Api
  class WebsitesController < ApiBaseController
    def create
      pages = JSON.parse(params_website[:pages])
      maps = JSON.parse(params_website[:maps].presence || "[]")
      map_images = JSON.parse(params_website[:map_images])

      repo = Repo.available.first
      website = Website.new(repo: repo, title: params_website["title"],
        description: params_website["description"], name: params_website["name"], resources: params_website["resources"])
      website.user_website_roles.new(user_id: Encrypt.decrypt(params_website[:user_id]), role: 1)

      pages.map do |page|
        website.pages.new(html: page["html"], url: page["url"], name: page["name"])
      end

      maps.map do |map|
        website.maps.new(map_type: map["type"], variant: map["variant"], template_name: map["template_name"],
          parent_div: map["parent_div"], page_name: map["page_name"], limit_item: map["limit_item"], category_name: map["category_name"])

        if(map["type"] == "product" && map["variant"] == "category")
          check_avai = website.categories.find{ |cate| cate.name == map["category_name"] && cate.category_type == "product" }
          next if check_avai.present?

          website.categories.new(name: map["category_name"], editable: false, category_type: 1)
        elsif(map["type"] == "post" && map["variant"] == "category")
          check_avai = website.categories.find{ |cate| cate.name == map["category_name"] && cate.category_type == "post" }
          next if check_avai.present?

          website.categories.new(name: map["category_name"], editable: false, category_type: 2)
        end
      end

      map_images.map do |map|
        order =  website.map_images.count{ |web| web.element_name == map["element_name"] &&  web.page_name == map["page_name"] && web.parent_div == map["parent_div"] }
        website.map_images.new(page_name: map["page_name"], element_name: map["element_name"], parent_div: map["parent_div"], order: order)
      end

      if website.save
        render json: { status: 200, message: "Tạo thành công"}
      else
        render json: { status: 401, message: "Có lỗi xảy ra"}
      end
    end

    private

    def params_website
      params.require(:website)
    end
  end
end
