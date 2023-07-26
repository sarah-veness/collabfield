require 'rails_helper'

RSpec.feature 'Visit single post', type: :feature do
  let(:user) { create(:user) }
  let(:post) { create(:post) }

  scenario 'User goes to a post from the home page' do
    post
    visit root_path
    page.find('.single-post-card').click
    expect(page).to have_selector('p', text: post.content)

  end
end