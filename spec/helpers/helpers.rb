module Helpers
	def help
		:available
	end

	def build_attributes(*args)
		FactoryGirl.build(*args).attributes.delete_if do |k, v|
			["id", "created_at", "updated_at"].member?(k) || v.nil?
		end
	end

=begin
	module SessionHelpers
		def sign_up_with(email, password, confirmation)
			visit new_user_registration_path
			fill_in 'Email', with: email
			fill_in 'Password', with: password
			fill_in 'Password confirmation', :with => confirmation
			click_button 'Sign up'
		end

		def signin(email, password)
			visit new_user_session_path
			fill_in 'Email', with: email
			fill_in 'Password', with: password
			click_button 'Log in'
		end
	end
=end	
end