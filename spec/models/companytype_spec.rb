require 'rails_helper'

RSpec.describe Companytype, type: :model do
  
  it "has a valid factory" do
    expect(FactoryGirl.create(:companytype)).to be_valid
  end

  subject { Companytype.new }

  it "should be an instance of Companytype" do
  	expect(subject).to be_an_instance_of(Companytype)
  end

  it "is valid with valid attributes" do 
    expect(Companytype.new(:name => "test")).to be_valid
  end

  it "is not valid without a title" do
    companytype = Companytype.new(name: nil)
    expect(companytype).to_not be_valid
  end

  it "should be have the name set as startup" do
  	subject.name = "startup"
  	expect(subject.name).to eql("startup")
  end

  it "should have companytypes count = 0" do
    expect(Companytype.count).to eq(0)
  end

  it "should save" do
  	subject.name = "startup"
  	subject.save
  	expect(Companytype.count).to be(1)
  end

  it { should have_many(:companies) }
  after(:all) {Companytype.destroy_all}
end
