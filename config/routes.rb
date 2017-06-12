Rails.application.routes.draw do
  	devise_for :users

  	get "ads/:id", to: 'application#show'
	resources :companytypes, :ads

	resources :companies do 
		resources :flyers
	end

	resources :campaigns do 
		resources :runs
	end

	resources :qr_codes, only: [:new, :create]
	
	# companies 
	get "companies/:id/delete", to: 'companies#delete', as: 'delete_company'
	get "campaigns/:id/delete", to: 'campaigns#delete', as: 'delete_campaign'
	#get "runs/:id/download", to: 'companies#download', as: 'download_run'

	# runs
	get "runs/:id/delete", to: 'runs#delete', as: 'delete_run'
	get "runs/:id/newstatus", to: 'runs#newstatus', as: 'newstatus_run'
	post "/runs/:id/newstatus", to: 'runs#changestatus', as: 'changestatus_run'

	# flyers
	get "flyers", to: 'flyers#index', as: "flyers"
	post "flyers/:id/confirm", to: 'flyers#confirm', as: "confirm_flyer"
	delete "flyers/:id", to: 'flyers#destroy', as: "destroy_flyer"

	# landing page
	post "landings", to: 'landings#createSubscription'
	
	root :to => "landings#index"  
end
