require "spec_helper"

describe 'index', type: :feature do
  before do
    @app = application
    visit "/blog/#{application.blog.articles[0].data["category"].downcase}/"
  end

  context 'Menu' do

  end

  context 'Message' do

  end

  context 'main Part' do

  end

  context 'Footer' do

  end
end