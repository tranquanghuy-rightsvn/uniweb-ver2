source 'http://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.3'

gem 'rails', '~> 6.1.4', '>= 6.1.4.1'
gem 'mysql2', '~> 0.5'
gem 'puma', '~> 5.0'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'devise'
gem 'carrierwave'
gem 'figaro'
gem 'aws-sdk-s3'
gem 'rack-cors', :require => 'rack/cors'
gem 'fog-aws'
gem 'nokogiri'
gem "image_processing", ">= 1.2"
gem "mini_magick"
gem 'google-api-ruby-client'
gem 'google-api-client'
gem 'redis'
gem 'redis-client'
gem 'sidekiq'
gem 'elasticsearch', '7.0.0.pre'
gem 'openssl'
gem 'searchkick'
gem 'google-analytics-data-v1beta'
gem 'whenever', require: false

# deploy
gem 'capistrano'
gem 'capistrano3-puma'
gem 'capistrano-rails', require: false
gem 'capistrano-bundler', require: false
gem 'capistrano-rvm'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 4.1.0'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  gem 'spring'
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
