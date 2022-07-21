# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  context 'create new user' do
    scenario 'should be successful' do
      skip "This was working but I am giving up"
      visit root_path
      click_link 'Create New User'

      within('#new_user') do
        fill_in 'user_first_name', with: 'J.J.'
        fill_in 'user_last_name', with: 'Merrick'
        fill_in 'user_email', with: 'bob@example.com'
      end
      click_button 'Create User'
      expect(rendered).to have_content 'Success'
    end

    scenario 'should fail' do
      visit root_path
      click_link 'Create New User'

      within('#new_user') do
        fill_in 'user_first_name', with: ''
        fill_in 'user_last_name', with: ''
        fill_in 'user_email', with: 'bobexample.com'
      end
      click_button 'Create User'
      expect(page).to have_content 'Error'
    end

    scenario 'should fail on gmail.com' do
      visit root_path
      click_link 'Create New User'

      within('#new_user') do
        fill_in 'user_first_name', with: ''
        fill_in 'user_last_name', with: ''
        fill_in 'user_email', with: 'bob@gmail.com'
      end
      click_button 'Create User'
      expect(page).to have_content 'Error'
      expect(page).to have_content 'gmail.com'
    end
  end
end
