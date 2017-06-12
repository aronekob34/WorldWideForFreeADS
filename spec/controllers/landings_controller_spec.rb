require 'rails_helper'
require 'include_module_spec'

RSpec.describe LandingsController, type: :controller do
	
	context "logged in user" do

		login_user

		describe "GET #index" do
			
			it "routes user logged in to the user page" do
				get :index
				expect(response).to redirect_to companies_path
			end
		end
	end
end