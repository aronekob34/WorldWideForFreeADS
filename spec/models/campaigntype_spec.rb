require 'rails_helper'

RSpec.describe Campaigntype, type: :model do

	let(:campaigntype) { campaigntype = FactoryGirl.create(:campaigntype)}
	let(:campaigntype_with_promotions) { campaigntype = FactoryGirl.create(:campaigntype_with_promotions)}
	let(:invalidcampaigntype) { campaigntype = FactoryGirl.build(:invalidcampaigntype)}

	describe "validations" do

		it "has a valid factory" do
			expect(campaigntype).to be_valid
		end

		it "is invalid without a name, campaigntype" do
			expect(invalidcampaigntype).to_not be_valid
		end

		it "is invalid without a name" do
			newcampaigntype = FactoryGirl.build(:campaign, name: nil)
			expect(newcampaigntype).to_not be_valid
		end
	end

	describe "saving, updating and deleting" do

		it "returns the campaigntype name as a string" do
			campaigntype = FactoryGirl.create(:campaigntype, name: "Paper Campaign")
			expect(campaigntype.name).to eql("Paper Campaign")
		end

		it "should be an instance of Campaigntype" do
			expect(campaigntype).to be_an_instance_of(Campaigntype)
		end

		it "should correctly save" do
			expect{ campaigntype }.to change(Campaigntype, :count).by(1)
		end

		it "should correcly update" do
			campaigntype.update_attributes(:name => "FreeAds")
			expect(campaigntype.name).to eq("FreeAds")
		end

		it "should correctly delete" do
			campaigntype
			expect{ campaigntype.destroy! }.to change(Campaigntype, :count).by(-1)
		end

	end

	describe "associations"
end
