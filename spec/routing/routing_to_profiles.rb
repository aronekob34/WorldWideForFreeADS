require 'rails_helper'

RSpec.describe "routing to profiles", :type => :routing do

	it "routing not logged in users to the homepage" do
		expect(:get => "/").to route_to(
		:controller => "landings",
		:action => "index"
		)
	end

	context "logged in users" do
		

		it "verifying that request does not resolve in routing error" do 			
			expect(:get => "/").to_not raise_error(ActionController::RoutingError)
		end

	end

end
