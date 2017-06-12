FactoryGirl.define do
  factory :ad do
  	visits 1
    company
    run 
    selfpromotion false
  end
  factory :invalidad, :parent => :ad do
  	company nil
    run nil
  end
end
