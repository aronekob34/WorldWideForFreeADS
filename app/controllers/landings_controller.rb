class LandingsController < ApplicationController
	before_action :authenticate_user!, :except => [:index, :createSubscription]
	layout 'landing'

	def index		
        redirect_to companies_path if user_signed_in?
	end

	def createSubscription 
		@subscription = Subscription.new(input_params)
		if @subscription.save
			flash[:notice] = "Your Subscription was saved"
			redirect_to action: "index"
		else
			flash[:error] = "An error occurred, the subscription was not saved"
			render "new"
		end				
	end

	private

	def input_params
		params.require(:subscription).permit(:email)
	end
	
end
