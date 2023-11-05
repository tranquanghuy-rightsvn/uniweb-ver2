module RenderHtml
  class << self
    def render_default website, page
      "<!DOCTYPE html><html><head><title>" +  website.title + " - "  + page.name + "</title><meta http-equiv=\"Content-Language\" content=\"vi\"><meta charset=\"utf-8\"><meta name=\"copyright\" content=\"Copyright © 2023 by " + website.name + "\"><meta content=\"" + website.description + "\" name=\"abstract\"><meta content=\"" + website.description + "\" name=\"description\"><meta name=\"distribution\" content=\"Global\"><meta name=\"author\" content=\"Websitegiare.co\"><link rel=\"icon\" type=\"image/x-icon\" href=\"./images/favicon.ico\"><link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC\" crossorigin=\"anonymous\"><script src=\"https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js\" integrity=\"sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p\" crossorigin=\"anonymous\"></script><script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js\" integrity=\"sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF\" crossorigin=\"anonymous\"></script><link rel=\"stylesheet\" type=\"text/css\" href=\"./style.css\"></head><body>" + page.html + "</body></html>"

    end

    def render_post website, post
      "<!DOCTYPE html><html><head><title>" +  post.title + "</title><meta charset=\"utf-8\"><meta http-equiv=\"Content-Language\" content=\"vi\"><meta charset=\"utf-8\"><meta name=\"copyright\" content=\"Copyright © 2023 by " + website.name + "\"><meta content=\"" + post.description + "\" name=\"abstract\"><meta content=\"" + post.description + "\" name=\"description\"><meta name=\"distribution\" content=\"Global\"><meta name=\"author\" content=\"Websitegiare.co\"><link rel=\"icon\" type=\"image/x-icon\" href=\"./images/favicon.ico\"><link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC\" crossorigin=\"anonymous\"><script src=\"https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js\" integrity=\"sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p\" crossorigin=\"anonymous\"></script><script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js\" integrity=\"sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF\" crossorigin=\"anonymous\"></script><link rel=\"stylesheet\" type=\"text/css\" href=\"./style.css\"></head><body>" + website&.menu + post.real_content + render_refer_post(post) +  website&.footer + "</body></html>"
    end

    def render_product website, product
      "<!DOCTYPE html><html><head><title>" +  product.title + "</title><meta charset=\"utf-8\"><meta http-equiv=\"Content-Language\" content=\"vi\"><meta charset=\"utf-8\"><meta name=\"copyright\" content=\"Copyright © 2023 by " + website.name + "\"><meta content=\"" + product.description + "\" name=\"abstract\"><meta content=\"" + product.description + "\" name=\"description\"><meta name=\"distribution\" content=\"Global\"><meta name=\"author\" content=\"Websitegiare.co\"><link rel=\"icon\" type=\"image/x-icon\" href=\"./images/favicon.ico\"><link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC\" crossorigin=\"anonymous\"><script src=\"https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js\" integrity=\"sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p\" crossorigin=\"anonymous\"></script><script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js\" integrity=\"sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF\" crossorigin=\"anonymous\"></script><link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css\" integrity=\"sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==\" crossorigin=\"anonymous\" referrerpolicy=\"no-referrer\"/><link rel=\"stylesheet\" type=\"text/css\" href=\"./style.css\"></head><body>" + website&.menu + "<div class=\"header-box\"><h1>SẢN PHẨM</h1></div><div class=\"container\"><div class=\"row product-detail\"><div class=\"col-lg-4 col-sm-12\"><div id=\"carouselExampleIndicators\" class=\"carousel slide\" data-bs-ride=\"carousel\"><div class=\"carousel-indicators\">" + render_product_images_direction(product) + "</button></div><div class=\"carousel-inner\">"+ render_product_images(product) + "</div><button class=\"carousel-control-prev\" type=\"button\" data-bs-target=\"#carouselExampleIndicators\" data-bs-slide=\"prev\"><span class=\"carousel-control-prev-icon\" aria-hidden=\"true\"></span><span class=\"visually-hidden\">Previous</span></button><button class=\"carousel-control-next\" type=\"button\" data-bs-target=\"#carouselExampleIndicators\" data-bs-slide=\"next\"><span class=\"carousel-control-next-icon\" aria-hidden=\"true\"></span><span class=\"visually-hidden\">Next</span></button></div></div><div class=\"col-lg-8 col-sm-12 product-information\"><h1>" + product.title + "</h1><p class=\"product-price mb-5\">₫#{product.price}</p><p class=\"mt-5\"><b>Thông tin chi tiết:</b></p>" + product.real_content + "<button class='btn-addcart btn btn-outline-danger'> <i class=\"fas fa-cart-plus\"></i> Thêm vào giỏ hàng</button></div></div>" + render_refer_product(product) + website&.footer + "</body></html>"
    end

    def render_post_index_newest_type_1 website_id, _map, _post
      limit = 8

      posts = Post.where(website_id: website_id).order(id: :desc).limit(limit)

      posts.reduce('') do |html, post|
        html << "<div class=\"col-lg-3 col-sm-6 col-xs-12\"><a href=\"" + post.url + "\"><div class=\"post-item\"><img src=\"" +post.image_real_url + "\"><h4>" + post.title + "</h4></div></a></div>"
      end
    end

    def render_post_index_newest_type_2 website_id, _map, _post
      limit = 8

      posts = Post.where(website_id: website_id).order(id: :desc).limit(limit)

      posts.reduce('') do |html, post|
        html << "<div class=\"col-lg-3 col-sm-6 col-xs-12\"><a href=\"" + post.url + "\"><div class=\"post-item\"><img src=\"" + post.image_real_url + "\"><h4>" + post.title + "</h4></div></a></div>"
      end
    end

    def render_post_index_category_type_1 website_id, map, post
      return '' if map.category_name != post.category.name

      limit = 8

      posts = Post.where(website_id: website_id, category_id: post.category.id).order(id: :desc).limit(limit)

      posts.reduce('') do |html, post|
        html << "<div class=\"col-lg-3 col-sm-6 col-xs-12\"><a href=\"" + post.url + "\"><div class=\"post-item\"><img src=\"" + post.image_real_url + "\"><h4>" + post.title + "</h4></div></a></div>"
      end
    end

    def render_post_index_category_type_2 website_id, map, post
      return '' if map.category_name != post.category.name

      limit = 8

      posts = Post.where(website_id: website_id, category_id: post.category.id).order(id: :desc).limit(limit)

      posts.reduce('') do |html, post|
        html << "<div class=\"col-lg-3 col-sm-6 col-xs-12\"><a href=\"" + post.url + "\"><div class=\"post-item\"><img src=\"" + post.image_real_url + "\"><h4>" + post.title + "</h4></div></a></div>"
      end
    end

    def render_post_index_newest_type_4 website_id, _map, _post
      limit = 8

      posts = Post.where(website_id: website_id).order(id: :desc).limit(limit)

      posts.reduce('') do |html, post|
        html << "<div class=\"col-md-8 col-xs-12 mb-3\"><a href=\"" + post.url + "\"><div class=\"post-item\"><div class=\"row\"><div class=\"col-md-4 col-xs-12\"><img src=\"" + post.image_real_url + "\"></div><div class=\"col-md-8 col-xs-12\"><h4>" + post.title + "</h4><p>" + post.description.truncate(150) +"</p></div></div></div></a></div>"
      end
    end

    def render_product_index_newest_type_1 website_id, map, product
      limit = 12

      products = Product.where(website_id: website_id).order(id: :desc).limit(limit)

      products.reduce('') do |html, post|
        html << "<div class=\"col-sm-12 col-md-6 col-xl-3\">
          <a hre=\"#{product.url}\">
          <div class=\"card text-center\">
            <div class=\"image\">
              <img src=\"#{product.product_images.first.image_real_url}\">
            </div>
            <div class=\"about-product text-center\">
              <h4>#{product.title}</h4>
              <h5><small>₫ #{product.price}</small></h5>
              <button class=\"btn btn-success buy-now\">
                <i class=\"fas fa-cart-arrow-down\"></i>&nbsp;Thêm vào giỏ
              </button>
            </div>
          </div>
        </div>"
      end
    end

    def render_product_index_category_type_1 website_id, map, product
      limit = 12

      products = Product.where(website_id: website_id, category_id: product.category.id).order(id: :desc).limit(limit)

      products.reduce('') do |html, post|
        html << "<div class=\"col-sm-12 col-md-6 col-xl-3\">
          <a hre=\"#{product.url}\">
          <div class=\"card text-center\">
            <div class=\"image\">
              <img src=\"#{product.product_images.first.image_real_url}\">
            </div>
            <div class=\"about-product text-center\">
              <h4>#{product.title}</h4>
              <h5><small>₫ #{product.price}</small></h5>
              <button class=\"btn btn-success buy-now\">
                <i class=\"fas fa-cart-arrow-down\"></i>&nbsp;Thêm vào giỏ
              </button>
            </div>
          </div>
        </div>"
      end
    end

    private

    def render_refer_post post
      refer_ids = JSON.parse(post.refer_ids)
      return "" if refer_ids.blank?

      refer_posts = Post.where(id: refer_ids, website_id: post.website.id)
      html = '<div class="container post-refer mb-40"><h2>Tin liên quan</h2><div class="row mb-3">'
      refer_posts.map do |post|
        html << "<div class=\"col-3\"><img src=\"" + post.image_real_url + "\"></div><div class=\"col-9\"><a href=\"" + post.url + "\"><h3 class=\"mb-3\">" + post.title + "</h3><p>" + post.description.truncate(150) + "</p> </a></div>"
      end

      html << '</div></div>'
    end

    def render_product_images product
      html = ''
      product.product_images.map.with_index do |image, i|
        active = i == 0 ? "active" : ""
        html << "<div class=\"carousel-item #{active}\"><img src=\"#{image.image_real_url}\" class=\"d-block w-100\" alt=\"#{product.title}\"></div>"
      end
      html
    end

    def render_refer_product product
      refer_ids = JSON.parse(product.refer_ids)
      return "" if refer_ids.blank?

      refer_products = Product.where(id: refer_ids, website_id: product.website.id)
      html = '<div class="product-refer"><h2> Sản phẩm liên quan </h2><div class="row">'
      refer_products.map do |product|
        html << "<div class=\"col-sm-12 col-md-6 col-xl-3\">
          <a hre=\"#{product.url}\">
          <div class=\"card text-center\">
            <div class=\"image\">
              <img src=\"#{product.product_images.first.image_real_url}\">
            </div>
            <div class=\"about-product text-center\">
              <h4>#{product.title}</h4>
              <h5><small>₫ #{product.price}</small></h5>
              <button class=\"btn btn-success buy-now\">
                <i class=\"fas fa-cart-arrow-down\"></i>&nbsp;Thêm vào giỏ
              </button>
            </div>
          </div>
        </div>"
      end

      html << '</div></div>'
    end

    def render_product_images_direction product
      html = ''
      product.product_images.map.with_index do |image, i|
        active = i == 0 ? "active" : ""
        html << "<button type=\"button\" data-bs-target=\"#carouselExampleIndicators\" data-bs-slide-to=\"#{i}\" aria-label=\"Slide #{i + 1}\" class=\"#{active}\"></button>"
      end
      html
    end
  end
end
