class Run < ApplicationRecord
	require 'prawn'

	belongs_to :campaign
	belongs_to :language
	has_many :prints, inverse_of: :run, :dependent => :destroy
	has_many :ads, :dependent => :destroy

	accepts_nested_attributes_for :ads, :prints

	validates_presence_of :campaign_id, :city, :location
	#validates :ownads, numericality: { greater_than_or_equal_to: 0, less_than: 75}
	#validates :runprintnumber, numericality: { greater_than: 0, less_than: 80}
	#validates_with RunValidator, fields: [:current_user, :campaign_id, :status]

	def self.nextStatus(run)
		case run.status
		when "to distribute"
			return "completed"
		end
	end

	def self.operator(num, den)
		unless num == 0 || den.size == 0
			ads = (num / den.size).to_i 
			return ads 
		end
	end

  	def self.createAds(run)
	    campaign = run.campaign
	    company = campaign.company  		

	    run.ownads.times do
	      Ad.create(:company_id => company.id, :run_id => run.id, :selfpromotion => true, :visits => 0)
	    end

		if run.ownads < run.runprintnumber
		    otherads = run.runprintnumber - run.ownads
		    firstgroup = (otherads*0.70).ceil
		    secondgroup = otherads - firstgroup 

		    campaigns = Campaign.filtered(run)
		    campaigns = campaigns.joins(:runs).where('runs.status' => "completed").distinct
		    
		    campaigns = campaigns.order(ratio_visits: :desc, created_at: :asc) # ads_received: :asc, 

		    campaigns = Campaign.filtered(run) if campaigns.size == 0 || firstgroup > campaigns.size

		    if firstgroup > campaigns.size
		    	ads = Run.operator(firstgroup, campaigns)
		    else
		    	numberofcompanies = ( firstgroup * 0.5 ).to_i
		    	campaigns = campaigns.limit(numberofcompanies)
		    	ads = 2
		    end

			Ad.postMultiple(campaigns, ads, run)

		    if firstgroup.odd? 
		      Ad.create(:company_id => campaigns[0].company.id, :run_id => run.id, :selfpromotion => false, :visits => 0)
		      campaigns[0].ads_received += 1
		      campaigns[0].save
		    end

			campaigns = Campaign.filtered(run)
			campaigns = campaigns.limit(secondgroup) if campaigns.size > secondgroup 

			ads = Run.operator(secondgroup, campaigns)    
		    Ad.postMultiple(campaigns, ads, run) unless secondgroup == 0
		end
 	end

end
