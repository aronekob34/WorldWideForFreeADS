class Companytype < ApplicationRecord
	has_many :companies, :dependent => :destroy

	validates_presence_of :name
end
