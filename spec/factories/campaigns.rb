FactoryGirl.define do
  factory :campaign do
    name { Faker::Company.name }
    targetcountries { Faker::Address.country }
    campaigntype { Campaigntype.first}
    company  
    givenvisits { Faker::Number.positive(3)}
    obtainedvisits { Faker::Number.positive(3)}
    visitratio 1
    ads_received { Faker::Number.positive(3)}

    factory :campaign_with_runs do

      transient do 
        runs_count 5
      end
      after(:create) do |campaign, evaluator|
        create_list(:run, evaluator.runs_count, campaign: campaign )
      end
    end

  end

  factory :invalidcampaign, :parent => :campaign do |f|
    f.name nil
    campaigntype nil
    company nil
    f.targetcountries nil
  end
  
end
