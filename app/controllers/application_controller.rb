class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, :except => [:show]

  # GET /ads/1
  # GET /ads/1.json
  def show
    #binding.pry
    @ad = Ad.find(params[:id])
    Ad.visits(@ad)
    Campaign.visits(@ad)
    redirect_to Ad.url(@ad) # "https://www.facebook.com"
  end

  protected

	def after_sign_in_path_for(resource)
		if current_user.companies.empty?
      new_company_path
    else
      companies_path
    end
	end

  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :firstname, :lastname, :country, :city]) 
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :firstname, :lastname, :country, :city])     
	end  		
end
