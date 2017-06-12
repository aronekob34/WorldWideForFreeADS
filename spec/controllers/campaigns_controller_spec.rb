require 'rails_helper'
require 'include_module_spec'

RSpec.describe CampaignsController, type: :controller do
	login_user

	describe "GET #index" do 

		it "assigns all campaigns to the @campaigns variable" do
			campaigns = Campaign.all
			get :index
			expect(assigns[:campaigns]).to eq(campaigns)
		end

		it "renders an index template" do
			get :index
			expect(response).to render_template "index"
		end

		it "has a 200 status code" do
			get :index
			expect(response.status).to eq(200)
		end

	end

	describe "GET #new" do

		it "assigns a new campaign to the @campaign variable" do
			campaign = Campaign.new
			get :new
			expect(campaign).to eq(campaign)
		end

		it "should render the new template" do
			get :new
			expect(response).to render_template "new"
		end

		it "has a 200 status code" do
			get :new
			expect(response.status).to eq(200)
		end

	end

	describe "POST #create" do

		before(:each) do 
			@campaign = FactoryGirl.build(:campaign)
		end

		describe "responde to" do
			it "responds to html by default" do
				post :create, params: { campaign: build_attributes(:campaign) }
				expect(response.content_type).to eq "text/html"
			end
		end

		describe "a campaign object" do
			it "should have a campaigntype" do
				campaign = Campaign.new
				expect(campaign).to_not be_valid
			end

			it "creates a new campaign" do
				expect{ 
					post :create, params: { campaign: build_attributes(:campaign) }
				}.to change(Campaign, :count).by(1)
			end 

			it "saves the campaign" do
				expect { 
					post :create, params: { campaign: build_attributes(:campaign) }
					}.to change(Campaign, :count).by(1)
			end					

			it "saves the camapaign and has a company" do 
				post :create, params: { campaign: build_attributes(:campaign) }
				expect(Campaign.last.company).to_not be_nil
			end
		end

	end

	describe "GET #edit" do
		it "assigns the requested campaign to @campaign" do
			campaign = FactoryGirl.create(:campaign)
			get :edit, params: { id: campaign }
			expect(assigns(:campaign)).to eq(campaign)
		end

		it "renders the #edit view" do
			get :edit, params: {id: FactoryGirl.create(:campaign)}
			expect(response).to render_template "edit"
		end

		it "redirects to the correct path when clicking the back button"
	end


	describe "PUT #update" do 
		before :each do
			@campaign = FactoryGirl.create(:campaign, name: "testcampaign")
		end

		context "valid attributes" do
			it "located the requested @campaign" do
				put :update, params: { id: @campaign, campaign: FactoryGirl.attributes_for(:campaign)}
				expect(assigns(:campaign)).to eq(@campaign)
			end

			it "changes @contact's attributes" do
				put :update, params: { id: @campaign, campaign: FactoryGirl.attributes_for(:campaign, name: "othercampaign")}
				@campaign.reload
				expect(@campaign.name).to eq("othercampaign")
			end


			it "redirects to the updated contact" do
				put :update, params: { id: @campaign, campaign: FactoryGirl.attributes_for(:campaign)}
				expect(response).to redirect_to action: "index"
			end
		end

		context "invalid attributes" do
			it "locates the requested @campaign" do
				put :update, params: 
				{ id: @campaign, campaign: FactoryGirl.attributes_for(:invalidcampaign)}
				expect(assigns[:campaign]).to eq(@campaign)
			end

			it "does not change @campaign's attributes" do
				put :update, params: 
				{ id: @campaign, campaign: {name: nil, targetcountries: "Italy"}}
				@campaign.reload
				expect(@campaign.targetcountries).to_not eq("Italy")
				expect(@campaign.name).to eq("testcampaign")
			end

			it "re-renders the edit method" do
				put :update, params: 
				{ id: @campaign, campaign: FactoryGirl.attributes_for(:invalidcampaign) }
				expect(response).to render_template "edit"
			end
		end
	end

	describe "GET #show" do 
		before(:each) { @campaign = FactoryGirl.create(:campaign) }
		it "will render the show template" do
			get :show, params: { id: @campaign}
			expect(response.body).to render_template "show"
		end

		it "will select the campaign in @campaign" do
			get :show, params: { id: @campaign, campaign: build_attributes(:campaign)}
			expect(assigns(:campaign)).to eq(@campaign)
		end

	end

	describe "GET #delete" do
		before(:each) do 
			@campaign = FactoryGirl.create(:campaign)
		end

		it "renders the delete template" do
			get :delete, params: {id: @campaign}
			expect(response).to render_template "delete"
		end

		it "assigns the requested campaign to @campaign" do
			get :delete, params: {id: @campaign}
			expect(assigns(:campaign)).to eq(@campaign)
		end
	end

	describe "DELETE #destroy" do 
		before :each do 
			@campaign = FactoryGirl.create(:campaign)
		end

		it "deletes the campaign" do
			expect{
				delete :destroy, params: { id: @campaign }
			}.to change(Campaign, :count).by(-1)
		end

		it "redirects to companies#index" do
			delete :destroy, params: { id: @campaign }
			expect(response).to redirect_to campaigns_url
		end
	end

end
