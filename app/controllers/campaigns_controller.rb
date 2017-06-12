class CampaignsController < ApplicationController

	def index	
		@campaigns = current_user.campaigns
	end

	def new
		@campaign = Campaign.new
		@company = Company.find(params[:format]) if params[:format].present?
	end

	def create 
		@campaign = Campaign.new(input_params)
		if @campaign.save
			flash[:notice] = "Your Campaign was saved, now you can print your fliers by selecting the print button"
			flash[:warning_campaign] = "Click on the print icon to create your first print order." if current_user.runs.empty?						
			redirect_to companies_path
		else
			flash[:error] = "An error occurred, the Campaign was not saved"
			render "new"
		end		
	end

	def edit 
		@campaign = Campaign.find(params[:id])
	end

	def update
		@campaign = Campaign.find(params[:id])
		if @campaign.update_attributes(input_params)
			flash[:notice] = "Your Campaign was saved"
			redirect_to companies_path
		else
			flash[:error] = "An error occurred, the campaign was not saved"
			render "edit"
		end
	end

	def show
		@campaign = Campaign.find(params[:id])
	end

	def delete
		@campaign = Campaign.find(params[:id])
		@text = "Campaign"
	end

	def destroy
		@campaign = Campaign.find(params[:id])
		if @campaign.destroy
			flash[:notice] = "The Campaign was destroyed"
			redirect_to companies_path
		else
			flash[:error] = "An error occurred, the campaign was not saved"
			render "delete"
		end
	end

	private

	def input_params 
		params.require(:campaign).permit(:name,:campaigntype_id, :company_id, :worldwide, :america, :europe, :asia, :oceania)
	end

end
