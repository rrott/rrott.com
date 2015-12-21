require "middleman-smusher"

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

# Automatic image dimensions on image_tag helper
activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

# Use LiveReload

# Compass configuration
set :url_root, 'https://rott.org.ua'

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

page 'sitemap.xml', layout: false
page 'feed.xml', layout: false

activate :autoprefixer
activate :directory_indexes

# Build-specific configuration
configure :build do
  ignore 'images/*.psd'
  ignore 'stylesheets/lib/*'
  ignore 'stylesheets/vendor/*'
  ignore 'javascripts/lib/*'
  ignore 'javascripts/vendor/*'
  activate :disqus do |d|
    d.shortname = "production-shortname"
  end
  activate :minify_css
  activate :minify_javascript
  activate :cache_buster
  activate :relative_assets
  activate :smusher
  activate :asset_hash
  activate :robots, rules: [
    { user_agent: '*', allow: ['/'] }
  ],
  sitemap: "#{data.site.url}/sitemap.xml"
end

#activate :imageoptim
activate :webp do |webp|
  webp.append_extension = true
end

activate :search_engine_sitemap

activate :i18n
activate :meta_tags
activate :syntax, :line_numbers => true
activate :build_info
activate :spellcheck

activate :imageoptim do |options|
  # Use a build manifest to prevent re-compressing images between builds
  options.manifest = true
  options.image_extensions = %w(.png .jpg .gif .svg)
end

activate :blog do |blog|
  # set options on blog
  #blog.calendar_template
  blog.layout = "blog_layout"
  blog.prefix = "blog"
  blog.permalink = "{lang}/{title}.html"
  blog.paginate = true
  blog.page_link = "p{num}"
  blog.per_page = 10
end

activate :search do |search|
  search.resources = ['blog/', 'index.html', 'portfolio/']
  search.fields = {
    title:   {boost: 100, store: true, required: true},
    content: {boost: 50},
    url:     {index: false, store: true},
    author:  {boost: 30}
  }
end

configure :development do
  set :debug_assets, true
  activate :livereload

  activate :disqus do |d|
    # using a special shortname
    d.shortname = "development-shortname"
    # or setting to `nil` will stop Disqus loading
    d.shortname = nil
  end
end