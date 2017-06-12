# spec/factories/companytypes.rb

FactoryGirl.define do 
	factory :companytype do |f|
		f.name "startup"
	end

	factory :invalidcompanytype, parent: :companytype do |f|
		f.name nil
	end
end