module MetaInfoHelpers
  def current_page_url
    "#{site.url}#{current_page.url}"
  end

  def schema
    {
      "@context":    "http://schema.org",
      "@type":       "Person",
      "email":       site_config.email,
      "image":       site_config.image,
      "brand":       site_config.name,
      "url":         site_config.url,
      "jobTitle":    "Full-Stack ruby developer",
      "name":        "Roman Rott",
      "familyName":  "Rott",
      "givenName":   "Roman",
      "nationality": "Ukraine"
    }.to_json
  end
end
