require 'rails_helper'
#require 'include_module_spec'

RSpec.describe Company, type: :model do
  #login_user

  let(:user) { user = FactoryGirl.create(:user_with_companies)}
  let(:company) { company = FactoryGirl.build(:company) }
  
	subject { Company.new }

  describe "validations" do

    it { should validate_presence_of(:name)}

    #it { should validate_presence_of(:users) }

  end

  it "should be an intance of Company" do
  	expect(subject).to be_an_instance_of(Company)
  end

  it "should have companytype_id set to 1" do
  	subject.companytype_id = 1
  	expect(subject.companytype_id).to be(1)
  end
  
  it "should save the company with the user that created it" do
    user.companies << company
    company.save
    expect(user.companies.length).to be(6)
  end

  it "deletes the entry in the join table" do
    user.companies << company
    company.destroy
    user.companies.reload
    expect(user.companies.length).to be(5)
  end

  fixtures :companytypes
  it "should save" 

  it { should belong_to(:companytype)}  
  it { should have_and_belong_to_many(:users)}
  it { should have_many(:campaigns) }
  it "should belong to user"

  after(:all) {Companytype.destroy_all}
end
