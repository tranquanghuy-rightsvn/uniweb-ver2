module Api
  class SearchController < ApiBaseController
    def index
      website_id = eval(Encrypt.decrypt(params["data-website"]))[:website_id]
      resources = eval(Encrypt.decrypt(params["data-website"]))[:resources]
      result = {}
      if resources.include?("post")
        posts = Post.search(params[:search], where: { website_id: website_id })
        data_posts = posts.map do |post|
          {
            title: post.title,
            url: post.url,
            image: post&.image_real_url,
            description: post.description.truncate(50)
          }
        end

        result.merge!(posts: data_posts)
      end

      if resources.include?("product")
        products = Product.search(params[:search], where: { website_id: website_id })
        data_products = products.map do |product|
          {
            title: product.title,
            url: product.url,
            image: product.product_images.first.image_real_url,
            description: product.description.truncate(50)
          }
        end

        result.merge!(products: data_products)
      end

      render json: result
    end
  end
end
