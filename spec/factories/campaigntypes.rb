FactoryGirl.define do
  factory :campaigntype do
    name "Paper Campaign"
  end

  factory :invalidcampaigntype, :parent => :campaigntype do |f|
    name nil
  end
end
