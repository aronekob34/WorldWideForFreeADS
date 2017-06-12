require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

feature 'User edit', :devise do

	after(:each) do
		Warden.test_reset!
	end

	scenario 'user changes email address' do
		user = FactoryGirl.create(:user)
		login_as(user, :scope => :user)
		visit edit_user_registration_path(user)
		fill_in 'Email', :with => Faker::Internet.email
		fill_in 'Current password', :with => user.password
		click_button 'Update'
		txts = [I18n.t('devise.registrations.updated'), I18n.t('devise.registrations.update_needs_confirmation')]
		expect(page).to have_content(/.*#{txts[0]}.*|.*#{txts[1]}.*/)
	end

	scenario 'user changes firstname address' do
		user = FactoryGirl.create(:completeuser)
		login_as(user, :scope => :user)
		visit edit_user_registration_path(user)
		fill_in 'Firstname', :with => "Roberto"
		fill_in 'Current password', :with => user.password
		click_button 'Update'
		txts = [I18n.t('devise.registrations.updated'), I18n.t('devise.registrations.update_needs_confirmation')]
		user.reload
		expect(user.firstname).to eq("Roberto")
		expect(page).to have_content(/.*#{txts[0]}.*|.*#{txts[1]}.*/)
	end

	scenario 'user corrects error and submit' do
		user = FactoryGirl.create(:completeuser)
		login_as(user, :scope => :user)
		visit edit_user_registration_path(user)
		fill_in 'Firstname', :with => "Roberto"
		#fill_in 'Current password', :with => user.password
		click_button 'Update'
		fill_in 'Current password', :with => user.password
		click_button 'Update'
		txts = [I18n.t('devise.registrations.updated'), I18n.t('devise.registrations.update_needs_confirmation')]
		user.reload
		expect(user.firstname).to eq("Roberto")
		expect(page).to have_content(/.*#{txts[0]}.*|.*#{txts[1]}.*/)
	end

	scenario "user cannot edit another user's profile", :me do
		me = FactoryGirl.create(:user)
		other = FactoryGirl.create(:user, email: Faker::Internet.email)
		login_as(me, :scope => :user)
		visit edit_user_registration_path(other)
		expect(page).to have_content 'Edit User'
		expect(page).to have_field('Email', with: me.email)
	end
end