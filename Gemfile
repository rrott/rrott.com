source 'https://rubygems.org'
ruby "2.4.1"
# ruby "2.4.1"

gem 'builder'
gem "middleman"
gem "middleman-blog"
gem 'middleman-blog-similar'
gem "middleman-disqus"
gem "middleman-es6", git: "https://github.com/vast/middleman-es6.git"
gem 'middleman-meta-tags'
gem 'middleman-robots'
gem 'middleman-search'
gem "middleman-syntax"
gem 'rake'
gem "redcarpet"

group :build do
  gem 'middleman-autoprefixer'
  gem 'middleman-build-info'
  gem 'middleman-minify-html'
  gem 'middleman-webp'
  gem "sitemap_generator"
  # gem 'middleman-imageoptim'
  # gem 'middleman-smusher'
end

group :test do
  gem 'capybara'
  gem 'rspec'
end

group :deploy do
  gem 'capistrano', '~> 3.4'
  gem 'capistrano-bundler'
  gem 'capistrano-deploy'
  gem 'middleman-deploy', '~> 1.0'
  # gem 'rvm1-capistrano3', require: false
end

group :development do
  gem 'middleman-livereload'
  gem 'middleman-pry'
  gem 'overcommit', require: false
  gem 'pry'
  gem 'rubocop', require: false
end
