module TemplateHelpers
  def current_page_url
    "#{data.site.url}#{current_page.url}"
  end

  def page_url(page)
    "#{data.site.url}#{page.url}"
  end

  def nofollow(param)
    param ? 'nofollow' : 'prefetch'
  end

  def open_for_remote
    data.settings.open_for_remote
  end
end
