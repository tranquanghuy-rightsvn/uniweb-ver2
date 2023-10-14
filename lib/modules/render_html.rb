module RenderHtml
  class << self
    def render_default website, page
      "<!DOCTYPE html><html><head><title>" +  website.title + " - "  + page.name + "</title><meta http-equiv=\"Content-Language\" content=\"vi\"><meta charset=\"utf-8\"><meta name=\"copyright\" content=\"Copyright © 2023 by " + website.name + "\"><meta content=\"" + website.description + "\" name=\"abstract\"><meta content=\"" + website.description + "\" name=\"description\"><meta name=\"distribution\" content=\"Global\"><meta name=\"author\" content=\"Websitegiare.co\"><link rel=\"icon\" type=\"image/x-icon\" href=\"./images/favicon.ico\"><link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC\" crossorigin=\"anonymous\"><script src=\"https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js\" integrity=\"sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p\" crossorigin=\"anonymous\"></script><script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js\" integrity=\"sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF\" crossorigin=\"anonymous\"></script><link rel=\"stylesheet\" type=\"text/css\" href=\"./style.css\"></head><body>" + page.html + "</body></html>"

    end

    def render_post website, post
      "<!DOCTYPE html><html><head><title>" +  post.title + "</title><meta charset=\"utf-8\"><meta http-equiv=\"Content-Language\" content=\"vi\"><meta charset=\"utf-8\"><meta name=\"copyright\" content=\"Copyright © 2023 by " + website.name + "\"><meta content=\"" + post.description + "\" name=\"abstract\"><meta content=\"" + post.description + "\" name=\"description\"><meta name=\"distribution\" content=\"Global\"><meta name=\"author\" content=\"Websitegiare.co\"><link rel=\"icon\" type=\"image/x-icon\" href=\"./images/favicon.ico\"><link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC\" crossorigin=\"anonymous\"><script src=\"https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js\" integrity=\"sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p\" crossorigin=\"anonymous\"></script><script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js\" integrity=\"sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF\" crossorigin=\"anonymous\"></script><link rel=\"stylesheet\" type=\"text/css\" href=\"./style.css\"></head><body>" + website&.menu + post.real_content + render_refer_post(post) +  website&.footer + "</body></html>"
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
  end
end
