# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


companytype = Companytype.create(:name => "startup")
campaigntype = Campaigntype.create(:name => "Paper Advertisement")

# Languages

language = Language.create(:iso => "EN", :name => "English")
language = Language.create(:iso => "IT", :name => "Italian")

# Starting creating a User - Company - Campaign - Run

user = User.create(:email => "fabrizio.bertoglio@gmail.com", :firstname => "Fabrizio", :lastname => "Bertoglio", :country => "IT", :city => "Torino",:password => "fabrizioowner", :password_confirmation => "fabrizioowner")

companytype = Companytype.first
user = User.last
campaigntype = Campaigntype.last


company = Company.create(:name => "StartupAds", :title => "Free Advertisement Worldwide distribution", :description => "Free Advertisement Worldwide distribution", :url => "growstartups.xyz", :companytype_id => companytype.id)
user.companies << company
campaign = Campaign.create(:name => "Paper Advertisement Campaign", :campaigntype_id => campaigntype.id, :company_id => company.id)

# Starting creating a User - Company - Campaign - Run

user = User.create(:email => "federico.bertoglio@gmail.com", :firstname => "Fabrizio", :lastname => "Bertoglio", :country => "IT", :city => "Torino",:password => "fabrizioowner", :password_confirmation => "fabrizioowner")

companytype = Companytype.first
user = User.last
campaigntype = Campaigntype.last


company = Company.create(:name => "Application 1", :title => "Free Advertisement Worldwide distribution", :description => "Free Advertisement Worldwide distribution", :url => "facebook.com", :companytype_id => companytype.id)
user.companies << company
campaign = Campaign.create(:name => "Paper Advertisement Campaign", :campaigntype_id => campaigntype.id, :company_id => company.id)

# Starting creating a User - Company - Campaign - Run

user = User.create(:email => "filippo.bertoglio@gmail.com", :firstname => "Fabrizio", :lastname => "Bertoglio", :country => "IT", :city => "Torino",:password => "fabrizioowner", :password_confirmation => "fabrizioowner")

companytype = Companytype.first
user = User.last
campaigntype = Campaigntype.last


company = Company.create(:name => "Application 2", :title => "Free Advertisement Worldwide distribution", :description => "Free Advertisement Worldwide distribution", :url => "google.com", :companytype_id => companytype.id)
user.companies << company
campaign = Campaign.create(:name => "Paper Advertisement Campaign", :campaigntype_id => campaigntype.id, :company_id => company.id)

# Starting creating a User - Company - Campaign - Run

user = User.create(:email => "ezio.bertoglio@gmail.com", :firstname => "Fabrizio", :lastname => "Bertoglio", :country => "IT", :city => "Torino",:password => "fabrizioowner", :password_confirmation => "fabrizioowner")

companytype = Companytype.first
user = User.last
campaigntype = Campaigntype.last


company = Company.create(:name => "Application 3", :title => "Free Advertisement Worldwide distribution", :description => "Free Advertisement Worldwide distribution", :url => "youtube.com", :companytype_id => companytype.id)
user.companies << company
campaign = Campaign.create(:name => "Paper Advertisement Campaign", :campaigntype_id => campaigntype.id, :company_id => company.id)








