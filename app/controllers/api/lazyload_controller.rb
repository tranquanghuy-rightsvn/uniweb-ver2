module Api
  class LazyloadController < ApiBaseController
    def index
      website_data = eval(Encrypt.decrypt(params[:website_data]))
      website = Website.find website_data[:website_id]
      if params[:type] == 'newest'
        resources = website.send("#{params[:model]}s").order(id: :desc).offset(params[:offset]).limit(params[:limit])
      elsif params[:type] == 'category'
        category = website.categories.find_by(name: params[:category])
        resources = website.send("#{params[:model]}s").where(category_id: category.id).order(id: :desc).offset(params[:offset]).limit(params[:limit])
      else
        resources = []
      end

      render json: {
        data: {resources: handle_json(resources)}
      }
    end

    private

    def handle_json resources
      if params[:model] == 'product'
        resources.map do |resource|
          {
            url: resource.url,
            title: resource.title,
            price: resource.formated_price,
            image_url: resource.product_images.first.image_real_url,
            description: resource.description
          }
        end
      else
        resources.map do |resource|
          {
            url: resource.url,
            title: resource.title,
            image_url: resource.image_real_url,
          }
        end
      end
    end
  end
end

