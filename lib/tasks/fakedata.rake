namespace :fakedata do
  desc "Generate 60 data products"
  task :build_product => :environment do
    puts "== Start create products =="
    website = Website.last
    category = website.categories.create! name: "Áo", category_type: "product"
    image_path = Rails.root.join("public/websites/images/kangaroo.jpg")
    60.times do |n|
      product = website.products.new category_id: Category.first.id, title: "title#{n}", url: "url-product#{n}.html", price: (2300000 + n *1000), description: "This is the description of product #{n}", website_id: website.id
      product.product_images.new image: File.open(image_path)

      product.save
    end

    puts " == End create products =="
  end

  desc "Generate 60 data posts"
  task :build_post => :environment do
    puts "== Start create posts =="
    website = Website.last
    category = website.categories.create! name: "Thể thao", category_type: "post"
    image_path = Rails.root.join("public/websites/images/kangaroo.jpg")
    60.times do |n|
      post = website.posts.new category_id: category.id, title: "title#{n}", url: "url-post#{n}.html", description: "This is the description of product #{n}", content: "Content #{n}", website_id: website.id, image: File.open(image_path)

      post.save
    end

    puts " == End create posts =="
  end

  desc "Generate 60 data posts category"
  task :build_post_category => :environment do
    puts "== Start create posts =="
    website = Website.last
    category = Category.last
    image_path = Rails.root.join("public/websites/images/kangaroo.jpg")
    60.times do |n|
      post = website.posts.new category_id: category.id, title: "title#{n}", url: "url-post#{n}.html", description: "This is the description of product #{n}", content: "Content #{n}", website_id: website.id, image: File.open(image_path)

      post.save
    end

    puts " == End create posts =="
  end

  desc "Generate 60 data products category"
  task :build_product_category => :environment do
    puts "== Start create products =="
    website = Website.last
    category = Category.last
    image_path = Rails.root.join("public/websites/images/kangaroo.jpg")
    60.times do |n|
      product = website.products.new category_id: category.id, title: "title#{n}", url: "url-product#{n}.html", price: (2300000 + n *1000), description: "This is the description of product #{n}", website_id: website.id
      product.product_images.new image: File.open(image_path)

      product.save
    end

    puts " == End create products =="
  end
end
