require 'rails_helper'

# RSpec.describe UsersController, type: :controller do
feature 'Visitor signs up' do
  scenario 'with valid email and password' do
    visit '/'

    expect(page).to have_field ('sessions_email')
    expect(page).to have_field ('sessions_password')

    page.fill_in 'sessions_email', with: 'kamil@yahoo.com'
    page.fill_in 'sessions_email', with: 'zaq12wsx'

    expect(page).to have_button('Zaloguj się')

    page.click_button('Zaloguj się')

    expect(page).to have_content "Log out"
  end
end
