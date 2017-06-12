require 'rails_helper'

RSpec.describe User, type: :model do

	let(:user) { FactoryGirl.create(:user)}
	let(:invaliduser) { FactoryGirl.build(:invaliduser)}
	let(:completeuser) { FactoryGirl.build(:completeuser)}

	describe "validations" do

		it "has a valid factory" do
			expect(user).to be_valid
			expect(invaliduser).to_not be_valid
		end

		it "is invalid without a email, password and country" do
			expect(invaliduser).to_not be_valid
		end

		it "is invalid without a email" do
			newuser = FactoryGirl.build(:user, email: nil)
			expect(newuser).to_not be_valid
		end

		it "is invalid without a password" do
			newuser = FactoryGirl.build(:user, password: nil)
			expect(newuser).to_not be_valid
		end

		it "is invalid without a country" do 
			newuser = FactoryGirl.build(:user, country: nil)
			expect(newuser).to_not be_valid
		end

	end

	describe "saving, updating and deleting" do

		it "returns the user name as a string" do
			user = FactoryGirl.create(:user, firstname: "FreeAdsWorldwide")
			expect(user.firstname).to eql("FreeAdsWorldwide")
		end

		it "should be an instance of Campaign" do
			expect(user).to be_an_instance_of(User)
		end

		it "should correctly save" do
			expect{ user }.to change(User, :count).by(1)
		end

		it "should correcly update" do
			user.update_attributes(:firstname => "FreeAds")
			expect(user.firstname).to eq("FreeAds")
		end

		it "should correctly delete" do
			user
			expect{ user.destroy! }.to change(User, :count).by(-1)
		end

		it "saves a complete user with all the correct fields" do 
			expect(completeuser).to have_attributes(:firstname => "Anna", :lastname => "Bella")
		end
	end

	describe "associations" do

		it { should have_and_belong_to_many(:companies)}

	end

end
