module MetaInfoHelpers
  def site_config
    data.config
  end

  def site
    data.site
  end

  def brands
    data.brands
  end

  def links
    data.links
  end

  def projects_list
    data.projects
  end

  def portfolio
    data.pages.portfolio
  end
end
