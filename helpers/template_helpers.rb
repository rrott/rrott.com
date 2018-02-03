module TemplateHelpers
  def current_page_url
    "#{site.url}#{current_page.url}"
  end

  def page_url(page)
    "#{site.url}#{page.url}"
  end

  def nofollow(param)
    param ? 'nofollow' : 'prefetch'
  end

  def open_for_remote
    site_config.open_for_remote
  end
end
