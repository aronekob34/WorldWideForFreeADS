class Company < ApplicationRecord
	has_and_belongs_to_many :users
	has_many :campaigns, :dependent => :destroy
	has_many :ads, :dependent => :destroy
	has_many :flyers, inverse_of: :company, :dependent => :destroy
	belongs_to :companytype

	accepts_nested_attributes_for :flyers, reject_if: lambda {|attributes|	attributes['image'].blank?} 

	validates_presence_of :name, :companytype, :description, :url
	#validates_associated :users
	#validates_presence_of :users
	validates :name, length: {minimim: 2, maximum: 24}
	#validates :description, length: {minimum: 70, maximum: 1500}


	def self.url(company)
		url = company.url
		
		if url.start_with?("http://")
			return url
		elsif url.start_with?("https://")
			return url
		elsif url.start_with?("https://www.")
			return url
		elsif url.start_with?("www.")
			return url = "https://" + url
		else 
			return url = "https://www." + url
		end
	end  	
end
