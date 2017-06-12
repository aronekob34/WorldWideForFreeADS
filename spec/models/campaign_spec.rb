require 'rails_helper'

RSpec.describe Campaign, type: :model do

	subject { FactoryGirl.build(:campaign)}
	let(:campaign) { campaign = FactoryGirl.create(:campaign) }
	let(:invalidcampaign) { invalidcampaign = FactoryGirl.build(:invalidcampaign) }
	let(:company) { company = FactoryGirl.create(:company)}
	let(:campaigntype) { campaigntype = FactoryGirl.create(:campaigntype)}
	let(:campaign_with_runs) { campaign_with_runs = FactoryGirl.create(:campaign_with_runs)}

	describe "validations" do

		it "has a valid factory" do
			expect(campaign).to be_valid
			expect(company).to be_valid
			expect(campaign_with_runs).to be_valid
		end

		it "is invalid without a name, campaigntype" do
			expect(invalidcampaign).to_not be_valid
		end

		it "is invalid without a name" do
			newcampaign = FactoryGirl.build(:campaign, name: nil)
			expect(newcampaign).to_not be_valid
		end

		it "is invalid without a campaigntype" do
			newcampaign = FactoryGirl.build(:campaign, campaigntype: nil)
			expect(newcampaign).to_not be_valid
		end

		it "is invalid without a company" do 
			newcampaign = FactoryGirl.build(:campaign, company: nil)
			expect(newcampaign).to_not be_valid
		end

		it { should validate_uniqueness_of(:company_id).scoped_to(:campaigntype_id)
			.with_message("you can create only one type of Campaign for each company")}

	end

	describe "saving, updating and deleting" do

		it "returns the campaign name as a string" do
			campaign = FactoryGirl.create(:campaign, name: "FreeAdsWorldwide")
			expect(campaign.name).to eql("FreeAdsWorldwide")
		end

		it "should be an instance of Campaign" do
			expect(campaign).to be_an_instance_of(Campaign)
		end

		it "should correctly save" do
			expect{ campaign }.to change(Campaign, :count).by(1)
		end

		it "should correcly update" do
			campaign.update_attributes(:name => "FreeAds")
			expect(campaign.name).to eq("FreeAds")
		end

		it "should correctly delete" do
			campaign
			expect{ campaign.destroy! }.to change(Campaign, :count).by(-1)
		end

	end

	describe "associations" do

		it "should have one company" do
			expect(campaign.company).to_not be_nil
		end

		it "should have one user through company"

		it "should have one campaigntype" do
			expect(campaign.campaigntype).to_not be_nil
		end

		it "should store correctly different countries" do
			newcampaign = FactoryGirl.create(:campaign, targetcountries: "Italy")
			expect(newcampaign.targetcountries).to eq("Italy")
		end

		it "should store correctly different countries array"

	end

	it { should have_many(:runs)}
	it { should belong_to(:campaigntype) }
	it { should belong_to(:company) }
	

end