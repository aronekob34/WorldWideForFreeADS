require 'rails_helper'

feature 'Sign in', :devise do
	scenario 'user cannot sign in if not registered' do
		signin('test@example.com', 'please123')
		expect(page).to have_content(/Invalid Email or password/)
	end

	scenario 'user can sign in with valid credentails' do
		user = FactoryGirl.create(:user)
		signin(user.email, user.password)
		expect(page).to have_content(/Now you can register your company and configure your first Campaign/)
	end

	scenario 'user cannot sign in with wrong email' do
		user = FactoryGirl.create(:user)
		signin('invalidemail@gmail.com', user.password)
		expect(page).to have_content(/Invalid Email or password/)
	end

	scenario 'user cannot sign in with wrong password' do
		user = FactoryGirl.create(:user)
		signin(user.email, 'invalidpass')
		expect(page).to have_content(/Invalid Email or password/)
	end

	scenario 'after signin user is redirected to application page' do
		user = FactoryGirl.create(:user)
		signin(user.email, user.password)
		expect(page).to have_content(/Dashboard/)
	end

end