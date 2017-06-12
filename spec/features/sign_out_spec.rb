require 'rails_helper'

feature 'Sign out', :devise do
	def login_action
		user = FactoryGirl.create(:user)
		signin(user.email, user.password)
		expect(page).to have_content(/Dashboard/)
	end

	scenario 'signed in user tries to sign out' do
		login_action
		visit destroy_user_session_path
		expect(page).to have_content(/Signed out successfully/)
	end

end