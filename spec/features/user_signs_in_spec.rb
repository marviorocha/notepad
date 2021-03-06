require 'rails_helper'

RSpec.feature 'User signs in' do
  describe 'Check if user is login' do
    let(:user) { create(:user) }

    scenario 'with valid credentials' do
      visit new_user_session_path

      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'

      expect(page).to have_text 'Signed in successfully.'
      expect(page).to have_link 'Sign Out'
      expect(page).to have_title 'Welcome | Notepad'
      expect(page).to have_current_path root_path
    end

    scenario 'with invalid credentials' do
      user = build :user

      visit new_user_session_path

      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'

      expect(page).to have_text 'Invalid Email or password.'
      expect(page).to have_no_link 'Sign Out'
    end
  end
end
