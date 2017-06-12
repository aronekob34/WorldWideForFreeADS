class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    # associations
 	has_and_belongs_to_many :companies, :dependent => :destroy
 	has_many :campaigns, through: :companies, :dependent => :destroy
 	has_many :runs, through: :campaigns, :dependent => :destroy

 	# validations
 	validates_presence_of :country, :city, :email

 	def country_name
    	country = ISO3166::Country[country_code]
    	country.translations[I18n.locale.to_s] || country.name
  	end

end
