class WebsitegiareTest::CreateService
  attr_accessor :resource

  def initialize resource
    @resource = resource
  end

  def perform
    content_post = "<!DOCTYPE html>
      <html lang=\"vi\">

      <head>
        <script async src=\"https://www.googletagmanager.com/gtag/js?id=G-212SGVZWXM\"></script>
        <script>
          window.dataLayer = window.dataLayer || [];
          function gtag(){dataLayer.push(arguments);}
          gtag('js', new Date());

          gtag('config', 'G-212SGVZWXM');
        </script>
        <meta charset=\"utf-8\">
        <title>" + resource.title + "</title>
        <meta content=\"width=device-width, initial-scale=1.0\" name=\"viewport\">
        <meta content=\"" + resource.description + "\" name=\"description\">
        <meta name=\"robots\" content=\"index,follow\">
        <meta http-equiv=\"Content-Language\" content=\"vi\">
        <meta name=\"copyright\" content=\"Copyright © 2023 by Websitegiare.co\">
        <meta name=\"abstract\" content=\"Websitegiare.co Website thiết kế website giá rẻ số 1 Việt Nam\">
        <meta name=\"distribution\" content=\"Global\">
        <meta name=\"author\" content=\"Websitegiare.co\">
        <link rel=\"icon\" type=\"image/x-icon\" href=\"./img/favicon.png\">

        <link rel=\"preconnect\" href=\"https://fonts.googleapis.com\">
        <link rel=\"preconnect\" href=\"https://fonts.gstatic.com\" crossorigin>
        <link href=\"https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Playball&display=swap\" rel=\"stylesheet\">

        <link rel=\"stylesheet\" href=\"https://use.fontawesome.com/releases/v5.15.4/css/all.css\"/>
        <link href=\"https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css\" rel=\"stylesheet\">

        <link href=\"css/bootstrap.min.css\" rel=\"stylesheet\">

        <link href=\"css/style.css\" rel=\"stylesheet\">
      </head>

      <body>
        <div class=\"container-fluid nav-bar\">
          <div class=\"container\">
            <nav class=\"navbar navbar-light navbar-expand-lg py-4\">
              <a href=\"index.html\" class=\"navbar-brand\">
                <h1 class=\"text-primary fw-bold mb-0\">Website<span class=\"text-dark\">Giárẻ</span>.co </h1>
              </a>
            </nav>
          </div>
        </div>

        <div class=\"container-fluid\">
          <div class=\"box-content\">
            <i>" + resource.time_publish + "</i> <br><br>
            <h1>"+ resource.title + "</h1>

            <div class=\"content\">
              <div " +
               (resource.content_copied ? "class=\"content-copied\"" : "" ) +
               ">" + resource.content.body.to_s.gsub(/<action-text-attachment[^>]*>[^<]*<\/action-text-attachment>/, '') +
            "</div></div>
          </div>
        </div>


        <div class=\"container-fluid footer py-6 my-6 mb-0 bg-light wow bounceInUp\" data-wow-delay=\"0.1s\">
          <div class=\"container\">
            <div class=\"row\">
              <div class=\"col-lg-3 col-md-6\">
                <div class=\"footer-item\">
                  <h1 class=\"text-primary\">Website<span class=\"text-dark\">Giárẻ</span>.co</h1>
                  <p class=\"lh-lg mb-4\">Xây dựng website chuyên nghiệp, uy tín, giá rẻ nhất Việt Nam</p>
                  <div class=\"footer-icon d-flex\">
                    <a class=\"btn btn-primary btn-sm-square me-2 rounded-circle\" href=\"\"><i class=\"fab fa-facebook-f\"></i></a>
                    <a class=\"btn btn-primary btn-sm-square me-2 rounded-circle\" href=\"\"><i class=\"fab fa-twitter\"></i></a>
                    <a href=\"#\" class=\"btn btn-primary btn-sm-square me-2 rounded-circle\"><i class=\"fab fa-instagram\"></i></a>
                    <a href=\"#\" class=\"btn btn-primary btn-sm-square rounded-circle\"><i class=\"fab fa-linkedin-in\"></i></a>
                  </div>
                </div>
              </div>
              <div class=\"col-lg-3 col-md-6\">
                <div class=\"footer-item\">
                  <h4 class=\"mb-4\">Dịch vụ</h4>
                  <div class=\"d-flex flex-column align-items-start\">
                    <a class=\"text-body mb-3\" href=\"\"><i class=\"fa fa-check text-primary me-2\"></i>Hosting</a>
                    <a class=\"text-body mb-3\" href=\"\"><i class=\"fa fa-check text-primary me-2\"></i>Domain</a>
                    <a class=\"text-body mb-3\" href=\"\"><i class=\"fa fa-check text-primary me-2\"></i>Kho giao diện</a>
                    <a class=\"text-body mb-3\" href=\"\"><i class=\"fa fa-check text-primary me-2\"></i>Hỗ trợ 24/7</a>
                  </div>
                </div>
              </div>
              <div class=\"col-lg-3 col-md-6\">
                <div class=\"footer-item\">
                  <h4 class=\"mb-4\">Contact Us</h4>
                  <div class=\"d-flex flex-column align-items-start\">
                    <p><i class=\"fa fa-map-marker-alt text-primary me-2\"></i> 280/7, Trưng Nữ Vương, Đà Nẵng</p>
                    <p><i class=\"fa fa-phone-alt text-primary me-2\"></i> (+84) 96 407 40 43</p>
                    <p><i class=\"fas fa-envelope text-primary me-2\"></i> tranquanghuy1280@gmail.com</p>
                    <p><i class=\"fa fa-clock text-primary me-2\"></i> Hỗ trợ 24/7</p>
                  </div>
                </div>
              </div>
              <div class=\"col-lg-3 col-md-6\">
                <div class=\"footer-item\">
                  <h4 class=\"mb-4\">Đối tác</h4>
                  <div class=\"row g-2\">
                    <div class=\"col-4\">
                      <img src=\"img/momo.png\" class=\"img-fluid p-2\" alt=\"\">
                    </div>
                    <div class=\"col-4\">
                      <img src=\"img/vietcombank.webp\" class=\"img-fluid p-2\" alt=\"\">
                    </div>
                    <div class=\"col-4\">
                      <img src=\"img/techcombank.jpg\" class=\"img-fluid p-2\" alt=\"\">
                    </div>
                    <div class=\"col-4\">
                      <img src=\"img/bidv.png\" class=\"img-fluid p-2\" alt=\"\">
                    </div>
                    <div class=\"col-4\">
                      <img src=\"img/viettinbank.jpg\" class=\"img-fluid p-2\" alt=\"\">
                    </div>
                    <div class=\"col-4\">
                      <img src=\"img/agribank.png\" class=\"img-fluid p-2\" alt=\"\">
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>


        <div class=\"modal fade\" id=\"staticBackdrop\" data-bs-backdrop=\"static\" data-bs-keyboard=\"false\" tabindex=\"-1\" aria-labelledby=\"staticBackdropLabel\" aria-hidden=\"true\">
          <div class=\"modal-dialog\">
            <div class=\"modal-content\">
              <div class=\"modal-header\">
                <h5 class=\"modal-title\" id=\"staticBackdropLabel\">Bạn cần thiết kế website giá rẻ chất lượng?</h5>
                <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"modal\" aria-label=\"Close\"></button>
              </div>
              <div class=\"modal-body\">
                <h6>Liên hệ với tôi qua một trong các kênh sau:</h6>
                <p>
                  <i class=\"fas fa-phone\"></i> <a href=\"tel:0964074043\">096 407 4043</a> (gặp anh Huy)<br>
                  <i class=\"fas fa-envelope\"></i> <a href = \"mailto: tranquanghuy1280@gmail.com\">tranquanghuy1280@gmail.com</a><br>
                  <i class=\"fab fa-facebook-messenger\"></i> <a href=\"https://facebook.com/gindeptrai\">facebook.com/gindeptrai</a> (Quang Huy)<br>
                </p>
              </div>
              <div class=\"modal-footer\">
                <button type=\"button\" class=\"btn btn-secondary\" data-bs-dismiss=\"modal\">Đóng</button>
              </div>
            </div>
          </div>
        </div>


        <a href=\"#\" class=\"btn btn-md-square btn-primary rounded-circle back-to-top\"><i class=\"fa fa-arrow-up\"></i></a>


        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js\"></script>
        <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js\"></script>

        <script src=\"js/main.js\"></script>
      </body>
      </html>"


    File.open("projects/websitegiare_test/" + resource.url, 'w') { |file| file.write(content_post) }

    # Sửa media
    doc_media = Nokogiri::HTML(File.read('projects/websitegiare_test/media.html'))
    div_media = doc_media.at_css('#render-media')

    resource_img= resource.image.url.split("/")[-3..-1].join("/")
    div_media.inner_html = "<div class=\"col-lg-6 col-md-12\">
                                <div class=\"box-media\">
                                  <div class=\"media-img\">
                                    <img src=\"" + resource_img +"\">
                                  </div>

                                  <div class=\"media-title\">
                                    <a href=\"" + resource.url + "\">" + resource.title + "</a>
                                  </div>
                                </div>
                              </div>" + div_media.inner_html

    children = div_media.children

    if children.reject{|element| element.blank?}.length >= 21
      element_to_remove = children.reject{|element| element.blank?}[20]

      element_to_remove.remove
    end

    File.open('projects/websitegiare_test/media.html', 'w') { |file| file.write(doc_media.to_html) }

    # Sửa luu tru
    if WebsitegiareTest.count > 20
      resource_21 = WebsitegiareTest.order(id: :desc).offset(20).limit(1).first

      doc_store = Nokogiri::HTML(File.read('projects/websitegiare_test/media-luu-tru.html'))
      div_store = doc_store.at_css('#render-store')
      div_store.inner_html = "<div class=\"col-lg-6 col-md-12\">
                                <div class=\"box-store\">
                                  <div class=\"store-header\">
                                    <p> Admin</p>
                                    <i>" + resource_21.time_publish.to_s + "</i>
                                  </div>
                                  <div class=\"store-title\">
                                    <a href=\"" +  resource_21.url + "\">" + resource_21.title + "</a>
                                  </div>
                                </div>
                              </div>" + div_store.inner_html

      File.open('projects/websitegiare_test/media-luu-tru.html', 'w') { |file| file.write(doc_store.to_html) }
    end

    # Sửa sitemap/media

    doc_sitemap_media = Nokogiri::XML(File.read('projects/websitegiare_test/sitemaps/media.xml'))
    div_sitemap_media = doc_sitemap_media.at_css('urlset')

    div_sitemap_media.inner_html = "<url>
                    <loc>https://websitegiare.co/" + resource.url + "</loc>
                    <changefreq>yearly</changefreq>
                    <priority>0.9</priority>
                  </url" + div_sitemap_media.inner_html

    children = div_sitemap_media.children

    if children.reject{|element| element.blank?}.length >= 21
      element_to_remove = children.reject{|element| element.blank?}[20]

      element_to_remove.remove
    end

    File.write('projects/websitegiare_test/sitemaps/media.xml', doc_sitemap_media)


    # Sửa sitemaps/kho-luu-tru
    if resource_21
      doc_sitemap_store = Nokogiri::XML(File.read('projects/websitegiare_test/sitemaps/media-luu-tru.xml'))
      div_sitemap_store = doc_sitemap_store.at_css('urlset')
      div_sitemap_store.inner_html= "<url>
                    <loc>https://websitegiare.co/" + resource.url + "</loc>
                    <changefreq>yearly</changefreq>
                    <priority>0.6</priority>
                  </url" + div_sitemap_store.inner_html

      File.write('projects/websitegiare_test/sitemaps/media-luu-tru.xml', doc_sitemap_store)
    end

    #sửa sitemap.xml

    doc_sitemap = Nokogiri::XML(File.read('projects/websitegiare_test/sitemap.xml'))
    div_sitemap = doc_sitemap.css('sitemap')
    div_sitemap[0].at('lastmod').content = Time.current.strftime('%Y-%m-%dT%H:%M:%S%:z')
    div_sitemap[1].at('lastmod').content = Time.current.strftime('%Y-%m-%dT%H:%M:%S%:z')

    File.write('projects/websitegiare_test/sitemap.xml', doc_sitemap.to_xml)

    # system('cd projects/websitegiare && git add . && git commit --amend --no-edit && git push origin master -f')
  end
end
