require "spec_helper"

describe 'index', type: :feature do
  before do
    visit '/'
  end

  context 'promotion' do
    it 'displays the correct heading' do
      expect(page).to have_selector('h1', text: 'Hello, my name is Roman Rott')
    end

    it 'displays message that I am open for job' do
      expect(page).to have_selector('.is-center', 
        text: "Open for remote job opportunities. Contact me if you're interested"
      )
    end
  end

  # it 'displays the "New Blog" blog post' do
  #   expect(page).to have_selector('ul li a[href="/blog/2014/08/20/new-blog/"]', text: 'New Blog')
  # end

  # it 'properly links to the "New Blog" blog post' do
  #   click_link 'New Blog'

  #   expect(page).to have_selector('h2', text: 'New Blog')
  # end
end