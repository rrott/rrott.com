xml.instruct!
xml.feed "xmlns" => "http://www.w3.org/2005/Atom" do
  xml.title "rrott blog"
  xml.subtitle "Blog and Portfolio"
  xml.id "https://rrott.com/blog"
  xml.link "href" => "https://rrott.com/blog"
  xml.link "href" => "https://rrott.com/feed.xml", "rel" => "self"
  xml.updated blog.articles.first.date.to_time.iso8601
  xml.author { xml.name "rrott blog" }

  blog.articles[0..10].each do |article|
    xml.entry do
      xml.title article.title
      xml.link "rel" => "alternate", "href" => article.url
      xml.id article.url
      xml.published article.date.to_time.iso8601
      xml.updated article.date.to_time.iso8601
      xml.author { xml.name "rrott blog" }
      xml.summary article.summary, "type" => "html"
    end
  end
end