source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.4"

gem 'builder'
gem "middleman", '4.4.3'
gem "middleman-blog"
# gem 'middleman-blog-similar'
# gem 'middleman-deploy', '~> 1.0'
# gem "middleman-disqus"
# gem "middleman-es6", git: "https://github.com/vast/middleman-es6.git"
gem 'middleman-meta-tags'
# gem 'middleman-robots'
# gem 'middleman-search'
gem "middleman-syntax"
gem 'rake'
# gem 'haml', "6.1.0"
gem "redcarpet"

group :build do
  # gem 'middleman-autoprefixer'
  # gem 'middleman-build-info'
  # gem 'middleman-minify-html'
  # gem 'middleman-webp'
  gem "sitemap_generator"
  gem 'nokogiri'
  # gem 'middleman-imageoptim'
  # gem 'middleman-smusher'
end

group :test do
  # gem 'capybara'
  # gem 'rspec'
end

group :development do
  gem 'middleman-livereload'
  gem 'middleman-pry'
  gem 'pry'
end
