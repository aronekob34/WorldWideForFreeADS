require 'rails_helper'

RSpec.describe Run, type: :model do
	subject { FactoryGirl.build(:run)}
	let(:run) { run = FactoryGirl.create(:run) }
	let(:invalidrun) { invalidrun = FactoryGirl.build(:invalidrun) }

	describe "validations" do

		it "has a valid factory" do
			expect(run).to be_valid
		end

		it "is invalid without a runprintnumber, runtype" do
			expect(invalidrun).to_not be_valid
		end

		it "is invalid without a runprintnumber" do
			newrun = FactoryGirl.build(:run, runprintnumber: nil)
			expect(newrun).to_not be_valid
		end

		it "is invalid without ownads" do
			newrun = FactoryGirl.build(:run, ownads: nil)
			expect(newrun).to_not be_valid
		end

		it "is invalid without a campaign" do 
			newrun = FactoryGirl.build(:run, campaign: nil)
			expect(newrun).to_not be_valid
		end

	end

	describe "saving, updating and deleting" do

		it "returns the run name as a string" do
			run = FactoryGirl.create(:run, runprintnumber: 10)
			expect(run.runprintnumber).to eql(10)
		end

		it "should be an instance of Run" do
			expect(run).to be_an_instance_of(Run)
		end

		it "should correctly save" do
			expect{ run }.to change(Run, :count).by(1)
		end

		it "should correcly update" do
			run.update_attributes(:runprintnumber => 11)
			expect(run.runprintnumber).to eq(11)
		end

		it "should correctly delete" do
			run
			expect{ run.destroy! }.to change(Run, :count).by(-1)
		end

	end

	describe "associations" do

		it "should have one campaign" do
			expect(run.campaign).to_not be_nil
		end

	end

	describe "methods" do
		describe "createAds" do
			it "creates the correct number of Ads" do
				newcompany = FactoryGirl.create(:company)
				newcampaign = FactoryGirl.create(:campaign, :company_id => newcompany.id)
				newrun = FactoryGirl.create(:run, :campaign_id => newcampaign.id )
				Run.createAds(run)
				run.ads.reload
				expect(run.ads.size).to be(59)
			end
		end
	end

	it { should belong_to(:campaign) }

end
