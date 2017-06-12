# spec/factories/companies.rb

FactoryGirl.define do
	factory :company do |f|
		f.name { Faker::Company.name }
		f.title nil
		f.description nil
		companytype
		url { Faker::Internet.url }
	
		factory :company_with_users do

			transient do 
				users_count 5
			end

			after(:create) do |company, evaluator|
				create_list(:user, evaluator.users_count, companies: [company])
			end
		end

		factory :company_with_campaigns do

			transient do 
				campaigns_count 5
			end

			after(:create) do |company, evaluator|
				create_list(:campaign, evaluator.campaigns_count, company: company)
			end
		end
	end

	factory :invalidcompany, :parent => :company do |f|
		f.name nil
	end

end