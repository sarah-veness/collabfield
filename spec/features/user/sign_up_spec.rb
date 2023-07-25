require 'rails_helper'

RSpec.feature 'Sign Up', type: :feature do
  let(:user) { build(:user) }

  scenario 'user navigates to the sign up page and successfully signs up', js: true do
    visit root_path
    find('nav a', text: 'Sign Up').click
    fill_in 'user[name]', with: user.name
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    fill_in 'user[password_confirmation]', with: user.password_confirmation
    find('.sign-up-button').click
    expect(page).to have_selector('#user-settings')
  end
end