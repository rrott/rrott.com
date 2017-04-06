xml.instruct!
xml.urlset 'xmlns' => 'http://www.sitemaps.org/schemas/sitemap/0.9' do
  sitemap.resources.select { |page| page.path =~ /\.html/ }.each do |page|
    next unless page.path == '404.html'
    xml.url do
      xml.loc page_url(page).to_s
      xml.lastmod Date.today.to_time.iso8601
      xml.changefreq 'weekly'
      xml.priority '0.5'
    end
  end
end
