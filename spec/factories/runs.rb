FactoryGirl.define do
  factory :run do
	campaign
	runprintnumber 60
	ownads 15
  status "completed"
  end

  factory :invalidrun, :parent => :run do
  	campaign
  	runprintnumber nil
  	ownads nil
  end
end
