require "middleman-smusher"
require 'kramdown'
require "middleman-vcard"
# Automatic image dimensions on image_tag helper
activate :automatic_image_sizes

set :url_root, 'https://rrott.com'

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'
set :relative_links, true

page 'sitemap.xml', layout: false
page 'feed.xml', layout: false
page "/blog/feed.xml", :layout => false
page "robots.txt", :layout => false
page "humans.txt", :layout => false
proxy "/portfolio/index.html", "/portfolios.html", layout: :portfolios
page "/404.html", layout: false
page "/sitemap.html", layout: false
page "/blog.html", layout: :blog
ignore "/portfolios.html"
ignore "/portfolio.html"

data.pages.portfolio.each do |page|
  project_page = page[1]
  proxy "#{project_page.url}.html", "/portfolio.html", layout: :portfolio, locals: {
    type:         project_page.type,
    all_projects: project_page.projects_list,
    canonical:    project_page.canonical,
    keywords:     project_page.keywords,
    description:  project_page.description,
    title:        project_page.title,
    multipart:    project_page.multipart,
    message:      project_page.message
  }
end

# activate :search do |search|
#   search.resources = ['portfolio/', 'index.html']
#   search.index_path = 'search.json' # defaults to `search.json`
#   search.fields = {
#     title:   {boost: 100, store: true, required: true},
#     content: {boost: 50},
#     url:     {index: false, store: true},
#     author:  {boost: 30}
#   }
# end

#activate :autoprefixer
activate :directory_indexes
# Build-specific configuration
configure :build do
  ignore 'images/*.psd'
  ignore 'stylesheets/lib/*'
  ignore 'stylesheets/vendor/*'
  ignore 'javascripts/lib/*'
  ignore 'javascripts/vendor/*'
  ignore 'images/portfolio/*/origin/*'
  ignore 'images/portfolio/*/jpegs/*'
  ignore 'images/portfolio/*/small/*'
  ignore 'favicon/*'

  activate :gzip
  activate :disqus do |d|
    d.shortname = "production-shortname"
  end
  activate :minify_css
  activate :minify_javascript
  activate :minify_html
  #activate :cache_buster
  activate :relative_assets
  #activate :smusher
  #activate :asset_hash
  activate :robots, rules: [
    { user_agent: '*', allow: ['/'] }
  ],
  sitemap: "#{data.site.url}/sitemap.xml"

end

#activate :imageoptim
activate :webp do |webp|
  webp.append_extension = true
end

# activate :search_engine_sitemap

#activate :i18n
activate :build_info
#activate :spellcheck

# Enable syntax highlighting
set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true, :smartypants => true
activate :syntax, :line_numbers => true

# activate :imageoptim do |options|
#   # Use a build manifest to prevent re-compressing images between builds
#   options.manifest = true
#   options.image_extensions = %w(.png .jpg .gif .svg)
# end

activate :blog do |blog|
  # set options on blog
  #blog.calendar_template
  blog.layout = "blog"
  blog.prefix = "blog"
  blog.permalink = "{title}.html"
  blog.paginate = true
  blog.page_link = "p{num}"
  blog.per_page = 10
  blog.summary_separator = /(READMORE)/
  blog.summary_length = 250
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

# activate :vcard,
#   name: 'Roman Rott'
