source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.2"

gem 'builder'
gem "middleman", '4.3.11'
gem "middleman-blog"
gem 'middleman-blog-similar'
# gem 'middleman-deploy', '~> 1.0'
# gem "middleman-disqus"
# gem "middleman-es6", git: "https://github.com/vast/middleman-es6.git"
gem 'middleman-meta-tags'
gem 'middleman-robots'
# gem 'middleman-search'
gem "middleman-syntax"
gem 'rake'
gem "redcarpet"

group :build do
  gem 'middleman-autoprefixer'
  # gem 'middleman-build-info'
  gem 'middleman-minify-html'
  gem 'middleman-webp'
  gem "sitemap_generator"
  # gem 'middleman-imageoptim'
  # gem 'middleman-smusher'
end

group :test do
  gem 'capybara', '>= 3.35.3'
  gem 'rspec'
end

group :development do
  gem 'middleman-livereload'
  gem 'middleman-pry'
  gem 'pry'
end
