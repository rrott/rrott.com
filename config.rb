###
# Compass
###

# Susy grids in Compass
# First: gem install susy
# require 'susy'

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

# Use LiveReload
activate :livereload

# Compass configuration
set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# Build-specific configuration
configure :build do
  ignore 'images/*.psd'
  ignore 'stylesheets/lib/*'
  ignore 'stylesheets/vendor/*'
  ignore 'javascripts/lib/*'
  ignore 'javascripts/vendor/*'

  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  # activate :cache_buster

  # Use relative URLs
  # activate :relative_assets

  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher

  # Or use a different image path
  # set :http_path, "/Content/images/"
end

activate :imageoptim
activate :webp do |webp|
  webp.append_extension = true
end

activate :i18n
activate :meta_tags
activate :syntax, :line_numbers => true

activate :blog do |blog|
  # set options on blog
  #blog.calendar_template
  blog.layout = "blog"
  blog.prefix = "blog"
  blog.permalink = "blog/{year}/{month}/{lang}/{title}/.html"
  blog.paginate = true
  blog.page_link = "p{num}"
  blog.per_page = 10
end

configure :development do
  activate :disqus do |d|
    # using a special shortname
    d.shortname = "development-shortname"
    # or setting to `nil` will stop Disqus loading
    d.shortname = nil
  end
end

configure :build do
  activate :disqus do |d|
    # using a different shortname for production builds
    d.shortname = "production-shortname"
  end
end