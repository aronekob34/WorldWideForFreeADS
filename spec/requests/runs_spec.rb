require 'rails_helper'

RSpec.describe "Runs", type: :request do

	before do 
		# Sign in as a user
		sign_in_as_a_valid_user
	end

	describe "GET /runs" do
		it "works! (now write some real specs)" do
		  get "/runs", params: {}, headers: {}
		  expect(response).to have_http_status(200)
		end
	end
end
