class Campaign < ApplicationRecord
	has_many :runs, :dependent => :destroy
	belongs_to :campaigntype
	belongs_to :company

	validates_presence_of :name, :company_id, :campaigntype_id
	validates_uniqueness_of :company_id, scope: [:campaigntype_id], :message => "you can create only one type of Campaign for each company"
	
	def self.filtered(run)
	    campaigns = Campaign.where.not(:company_id => run.campaign.company.id).rewhere(:campaigntype_id => run.campaign.campaigntype_id)
	    return campaigns
	end	

	def self.visits(ad)
		promoter_campaign = ad.run.campaign
		campaigntype =  ad.run.campaign.campaigntype
		company_campaign = ad.company.campaigns.where(:campaigntype_id => campaigntype.id).first

		promoter_campaign.givenvisits += 1 unless ad.selfpromotion  
		company_campaign.obtainedvisits += 1 unless ad.selfpromotion

		promoter_campaign.save
		company_campaign.save
		promoter_campaign.reload
		company_campaign.reload
		promoter_campaign.visitratio = promoter_campaign.givenvisits / promoter_campaign.obtainedvisits 
		company_campaign.visitratio = company_campaign.givenvisits / company_campaign.obtainedvisits 
		promoter_campaign.save
		company_campaign.save
	end	
end