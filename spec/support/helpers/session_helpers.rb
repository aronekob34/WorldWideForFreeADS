module Features
	module SessionHelpers
		def sign_up_with(email, password, confirmation, firstname, lastname, country)
			visit new_user_registration_path
			fill_in 'Email', with: email
			fill_in 'Password', with: password
			fill_in 'Password confirmation', :with => confirmation
			fill_in 'Firstname', with: firstname
			fill_in 'Lastname', with: lastname
			page.select("Italy", :from => "country_select")
			click_button 'Sign up'
		end

		def signin(email, password)
			visit new_user_session_path
			fill_in 'Email Address', with: email
			fill_in 'Password', with: password
			click_button 'Log in'
		end
	end
end