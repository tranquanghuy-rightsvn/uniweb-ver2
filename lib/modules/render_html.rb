module RenderHtml
  class << self
    def render_default website, page
      "<!DOCTYPE html><html><head><title>" +  website.title + " - "  + page.name + "</title><meta http-equiv=\"Content-Language\" content=\"vi\"><meta charset=\"utf-8\"><meta name=\"copyright\" content=\"Copyright © 2023 by " + website.name + "\"><meta content=\"" + website.description + "\" name=\"abstract\"><meta content=\"" + website.description + "\" name=\"description\"><meta name=\"distribution\" content=\"Global\"><meta name=\"author\" content=\"Websitegiare.co\"><meta name=\"robots\" content=\"index,follow\"><link rel=\"icon\" type=\"image/x-icon\" href=\"./images/favicon.ico\"><link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC\" crossorigin=\"anonymous\"><script src=\"https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js\" integrity=\"sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p\" crossorigin=\"anonymous\"></script><script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js\" integrity=\"sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF\" crossorigin=\"anonymous\"></script>
        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css\" integrity=\"sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==\" crossorigin=\"anonymous\" referrerpolicy=\"no-referrer\" />
        <link rel=\"stylesheet\" type=\"text/css\" href=\"./style.css\"></head><body>" + page.html + render_signature(website) + "<script src=\"https://code.jquery.com/jquery-3.7.1.js\" integrity=\"sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=\" crossorigin=\"anonymous\"></script><script src=\"./index.js\"></script></body></html>"

    end

    def render_post website, post
      "<!DOCTYPE html><html><head><title>" +  post.title + "</title><meta charset=\"utf-8\"><meta http-equiv=\"Content-Language\" content=\"vi\"><meta charset=\"utf-8\"><meta name=\"copyright\" content=\"Copyright © 2023 by " + website.name + "\"><meta content=\"" + post.description + "\" name=\"abstract\"><meta content=\"" + post.description + "\" name=\"description\"><meta name=\"distribution\" content=\"Global\"><meta name=\"author\" content=\"Websitegiare.co\"><meta name=\"robots\" content=\"index,follow\"><link rel=\"icon\" type=\"image/x-icon\" href=\"./images/favicon.ico\"><link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC\" crossorigin=\"anonymous\"><script src=\"https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js\" integrity=\"sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p\" crossorigin=\"anonymous\"></script><script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js\" integrity=\"sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF\" crossorigin=\"anonymous\"></script><link rel=\"stylesheet\" type=\"text/css\" href=\"./style.css\">" + render_schema_post(website, post) + "</head><body>" + website&.menu + post.real_content + render_refer_post(post) +  website&.footer + "<script src=\"./index.js\"></script></body></html>"
    end

    def render_product website, product
      "<!DOCTYPE html><html><head><title>" +  product.title + "</title><meta charset=\"utf-8\"><meta http-equiv=\"Content-Language\" content=\"vi\"><meta charset=\"utf-8\"><meta name=\"copyright\" content=\"Copyright © 2023 by " + website.name + "\"><meta content=\"" + product.description + "\" name=\"abstract\"><meta content=\"" + product.description + "\" name=\"description\"><meta name=\"distribution\" content=\"Global\"><meta name=\"author\" content=\"Websitegiare.co\"><meta name=\"robots\" content=\"index,follow\"><link rel=\"icon\" type=\"image/x-icon\" href=\"./images/favicon.ico\"><link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC\" crossorigin=\"anonymous\"><script src=\"https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js\" integrity=\"sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p\" crossorigin=\"anonymous\"></script><script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js\" integrity=\"sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF\" crossorigin=\"anonymous\"></script><link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css\" integrity=\"sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==\" crossorigin=\"anonymous\" referrerpolicy=\"no-referrer\"/><link rel=\"stylesheet\" type=\"text/css\" href=\"./style.css\">" + render_schema_product(website, product) + "</head><body>" + website&.menu + "<div class=\"header-box\"><h1>SẢN PHẨM</h1></div><div class=\"container\"><div class=\"row product-detail\"><div class=\"col-lg-4 col-sm-12\"><div id=\"carouselExampleIndicators\" class=\"carousel slide\" data-bs-ride=\"carousel\"><div class=\"carousel-indicators\">" + render_product_images_direction(product) + "</button></div><div class=\"carousel-inner\">"+ render_product_images(product) + "</div><button class=\"carousel-control-prev\" type=\"button\" data-bs-target=\"#carouselExampleIndicators\" data-bs-slide=\"prev\"><span class=\"carousel-control-prev-icon\" aria-hidden=\"true\"></span><span class=\"visually-hidden\">Previous</span></button><button class=\"carousel-control-next\" type=\"button\" data-bs-target=\"#carouselExampleIndicators\" data-bs-slide=\"next\"><span class=\"carousel-control-next-icon\" aria-hidden=\"true\"></span><span class=\"visually-hidden\">Next</span></button></div></div><div class=\"col-lg-8 col-sm-12 product-information\"><h1>" + product.title + "</h1><p class=\"product-price mb-5\">₫ #{product.formated_price}</p><p class=\"mt-5\"><b>Thông tin chi tiết:</b></p>" + product.real_content + "<button class='btn-addcart btn btn-outline-danger'> <i class=\"fas fa-cart-plus\"></i> Thêm vào giỏ hàng</button></div></div>" + render_refer_product(product) + website&.footer + "<script src=\"./index.js\"></script></body></html>"
    end

    def render_search_page(website)
      "<!DOCTYPE html><html><head><title>Tìm kiếm " + website.title + "</title><meta charset=\"utf-8\"><meta http-equiv=\"Content-Language\" content=\"vi\"><meta charset=\"utf-8\"><meta name=\"copyright\" content=\"Copyright © 2023 by " + website.name + "\"><meta name=\"distribution\" content=\"Global\"><meta name=\"author\" content=\"Websitegiare.co\"><meta name=\"robots\" content=\"noindex,nofollow\"><link rel=\"icon\" type=\"image/x-icon\" href=\"./images/favicon.ico\"><link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC\" crossorigin=\"anonymous\"><link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css\" integrity=\"sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==\" crossorigin=\"anonymous\" referrerpolicy=\"no-referrer\" /><script src=\"https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js\" integrity=\"sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p\" crossorigin=\"anonymous\"></script><script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js\" integrity=\"sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF\" crossorigin=\"anonymous\"></script><link rel=\"stylesheet\" type=\"text/css\" href=\"./style.css\"></head><body>" + website&.menu + "<div class=\"header-box\"><h1>TÌM KIẾM </h1></div><div class=\"container\"><div class=\"form-search form-group mt-2\"><input class=\"form-control\" id=\"formSearch\"><button class=\"btn btn-primary w-100px\" onclick=\"search()\"><i class=\"fas fa-search\"></i> Tìm kiếm </button></div><ul class=\"nav nav-tabs mt-2\" id=\"searchTab\" role=\"tablist\"><li class=\"nav-item\" role=\"presentation\"><button class=\"nav-link active\" id=\"product-tab\" data-bs-toggle=\"tab\" data-bs-target=\"#product\" type=\"button\" role=\"tab\" aria-controls=\"product\" aria-selected=\"true\">Sản phẩm</button></li><li class=\"nav-item\" role=\"presentation\"><button class=\"nav-link\" id=\"post-tab\" data-bs-toggle=\"tab\" data-bs-target=\"#post\" type=\"button\" role=\"tab\" aria-controls=\"post\" aria-selected=\"false\">Bài viết</button></li></ul><div class=\"tab-content\" id=\"searchTabContent\"><div class=\"tab-pane fade show active\" id=\"product\" role=\"tabpanel\" aria-labelledby=\"product-tab\"></div><div class=\"tab-pane fade\" id=\"post\" role=\"tabpanel\" aria-labelledby=\"post-tab\"></div></div></div>" + render_signature(website) + website&.footer + "<script src=\"https://code.jquery.com/jquery-3.7.1.min.js\" integrity=\"sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=\" crossorigin=\"anonymous\"></script><script src=\"./search.js\"></script><script src=\"./index.js\"></script></body></html>"
    end

    def render_cart_page(website)
      "<!DOCTYPE html><html><head><title>Giỏ hàng - " + website.title + "</title><meta charset=\"utf-8\"><meta http-equiv=\"Content-Language\" content=\"vi\"><meta charset=\"utf-8\"><meta name=\"copyright\" content=\"Copyright © 2023 by " + website.name + "\"><meta name=\"distribution\" content=\"Global\"><meta name=\"author\" content=\"Websitegiare.co\"><meta name=\"robots\" content=\"noindex,nofollow\"><link rel=\"icon\" type=\"image/x-icon\" href=\"./images/favicon.ico\"><link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC\" crossorigin=\"anonymous\"><link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css\" integrity=\"sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==\" crossorigin=\"anonymous\" referrerpolicy=\"no-referrer\" /><script src=\"https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js\" integrity=\"sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p\" crossorigin=\"anonymous\"></script><script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js\" integrity=\"sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF\" crossorigin=\"anonymous\"></script><link rel=\"stylesheet\" type=\"text/css\" href=\"./style.css\"></head><body>" + website&.menu + "<div class=\"header-box\"><h1>GIỎ HÀNG</h1></div><div class=\"container mt-5 mb-5\"><div class=\"list-cart\"></div><div class=\"infor-customer\"><h3> Thông tin giao hàng </h3><div class=\"row\"><div class=\"col-6\"><div class=\"form-group\"><label>Họ và Tên</label><input class=\"form-control\" type=\"text\" id=\"customer-fullname\"></div></div><div class=\"col-6\"><div class=\"form-group\"><label>Số điện thoại</label><input class=\"form-control\" type=\"text\" id=\"customer-phone-number\"></div></div><div class=\"col-4\"><div class=\"form-group\"><label>Tỉnh/TP</label><select id=\"customer-province\" class=\"form-select\"></select></div></div><div class=\"col-4\"><div class=\"form-group\"><label>Quận/Huyện</label><select id=\"customer-district\" class=\"form-select\"></select></div></div><div class=\"col-4\"><div class=\"form-group\"><label>Phường/Xã</label><select id=\"customer-ward\" class=\"form-select\"></select></div></div><div class=\"form-group\"><label>Địa chỉ nhà</label><input class=\"form-control\" type=\"text\" id=\"customer-address\"></div></div><div class=\"form-check\"><input class=\"form-check-input\" type=\"checkbox\" value=\"\" id=\"save_infor-user\"><label class=\"form-check-label\" for=\"save_infor-user\">Lưu thông tin của tôi</label></div></div><div class=\"shipping-cost\"><div class=\"row\"><div class=\"col-lg-8 col-6\"><h5>Phí ship: </h5></div><div class=\"col-lg-4 col-6\"><p class=\"shipping-price\"></p></div></div></div><div class=\"order-total\"><div class=\"row\"><div class=\"col-lg-8 col-6\"><h3>Tổng tiền:</h3></div><div class=\"col-lg-4 col-6\"><p class=\"total-price\"></p></div><div class=\"col-lg-8 col-6\"></div><div class=\"col-lg-4 col-6\"><button class=\"btn btn-primary\" onclick=\"buy()\">Mua hàng</button></div></div></div></div></div>" + render_signature(website) + website&.footer + "<span id=\"store-information\" data-inner-province =\"0\" data-outer-province =\"0\" data-provinces=\"[]\"></span><script src=\"https://code.jquery.com/jquery-3.7.1.min.js\" integrity=\"sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=\" crossorigin=\"anonymous\"></script><script src=\"./cart.js\"></script><script src=\"./index.js\"></script></body></html>"
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

    def render_product_index_newest_type_2 website_id, map, product
      limit = 12

      products = Product.where(website_id: website_id).order(id: :desc).limit(limit)

      products.reduce('') do |html, p|
        html << "<div class=\"col-xl-2 col-lg-3 col-md-4 col-sm-6 col-xs-12\"><div class=\"product-card\" data-product=\"#{p.encrypt_id}\"><a href=\"#{p.url}\"><div class=\"product-image\"><img src=\"#{p.product_images.first.image_real_url}\"></div><div class=\"product-information\"><h3>#{p.title}</h3><p>₫ #{p.formated_price}</p></div></a><button class=\"btn btn-outline-danger btn-product\" onclick=\"add_to_cart(this)\"><i class=\"fa-solid fa-cart-plus\"></i> Thêm vào giỏ hàng</button></div></div>"
      end
    end

    def render_product_index_category_type_2 website_id, map, product
      return '' if map.category_name != product.category.name

      limit = 12

      products = Product.where(website_id: website_id, category_id: product.category.id).order(id: :desc).limit(limit)

      products.reduce('') do |html, p|
        html << "<div class=\"col-xl-2 col-lg-3 col-md-4 col-sm-6 col-xs-12\"><div class=\"product-card\" data-product=\"#{p.encrypt_id}\"><a href=\"#{p.url}\"><div class=\"product-image\"><img src=\"#{p.product_images.first.image_real_url}\"></div><div class=\"product-information\"><h3>#{p.title}</h3><p>₫ #{p.formated_price}</p></div></a><button class=\"btn btn-outline-danger btn-product\" onclick=\"add_to_cart(this)\"><i class=\"fa-solid fa-cart-plus\"></i> Thêm vào giỏ hàng</button></div></div>"
      end
    end

    def render_product_all_newest_lazyload_type_1 _website_id, _map, _product
      "<span></span>"
    end

    def render_post_lazyload_index_newest_type_1 _website_id, _map, _product
      "<span></span>"
    end

    def render_post_lazyload_index_newest_type_2 _website_id, _map, _product
      "<span></span>"
    end

    def render_post_lazyload_all_category_type_1 _website_id, _map, _product
      "<span></span>"
    end

    def render_product_lazyload_all_category_type_1 _website_id, _map, _product
      "<span></span>"
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
      html = '<div class="container product-list mt-5 mb-5"><h2> Sản phẩm liên quan </h2><div class="row">'
      refer_products.map do |p|
        html << "<div class=\"col-xl-2 col-lg-3 col-md-4 col-sm-6 col-xs-12\"><div class=\"product-card\"><a href=\"#{p.url}\"><div class=\"product-image\"><img src=\"#{p.product_images.first.image_real_url}\"></div><div class=\"product-information\"><h3>#{p.title}</h3><p>₫ #{p.formated_price}</p></div></a><button class=\"btn btn-outline-danger btn-product\" onclick=\"add_to_cart(this)\"><i class=\"fa-solid fa-cart-plus\"></i> Thêm vào giỏ hàng</button></div></div>"
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

    def render_signature website
      data_website = Encrypt.encrypt({website_id: website.id, resources: JSON.parse(website.resources || "[\"post\", \"product\"]")}.to_s)
      "<span id=\"data-website\" data-website=#{data_website} ></span>"
    end

    def render_schema_post website, post
      "<script type=\"application/ld+json\">
        {
          \"@context\": \"http://schema.org\",
          \"@type\": \"Article\",
          \"headline\": \"" + post.title + "\",
          \"dateCreated\": \"" + post.formated_time.to_s + "\",
          \"datePublished\": \"" + post.formated_time.to_s + "\",
          \"dateModified\": \"" + post.formated_time.to_s + "\",
          \"author\": {
            \"@type\": \"Person\",
            \"name\": \"" + website.name + "\"
          },
          \"publisher\": {
            \"@type\": \"Organization\",
            \"name\": \"" + website.name + "\"
          },
          \"description\": \"" + post.description + "\",
          \"image\": #{post.content.embeds.map{|e| e.url }},
          \"url\": \"" + website.real_domain + post.url + "\",
          \"keywords\": #{JSON.parse(post.keywords)},
          \"logo\": {
            \"@type\": \"ImageObject\",
            \"url\": \"" + website.real_domain + post.image_real_url + "\"
          },
          \"mainEntityOfPage\": {
            \"@type\": \"WebPage\",
            \"url\": \"" + website.real_domain + post.url + "\",
            \"@id\": \"" + website.real_domain + post.url + "\"
          }
        }
      </script>"
    end

    def render_schema_product website, product
      "<script type=\"application/ld+json\">
        {
          \"@context\": \"http://schema.org\",
          \"@type\": \"Product\",
          \"name\": \"" + product.title + "\",
          \"image\": \"" + website.real_domain + product.product_images.first.image_real_url + "\",
          \"description\": \"" + product.description + "\",
          \"price\": {
            \"@type\": \"PriceSpecification\",
            \"price\": \"₫ " + product.formated_price + "\",
            \"currency\": \"VND\"
          },
          \"keywords\": #{JSON.parse(product.keywords)},
          \"availability\": \"In stock\"
        }
      </script>"
    end
  end
end
