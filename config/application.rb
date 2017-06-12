require_relative 'boot'

require 'rails/all'
require 'carrierwave'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FreeAdsWorldwide
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    #config.assets.enabled = true
    #config.assets.paths << Rails.root.join("vendor","assets", "img")    

    config.generators do |g|
    	g.test_framework :rspec,
    		:fixtures => true,
    		:view_specs => false,
    		:helper_specs => false,
    		:routing_specs => false,
    		:controller_specs => true,
    		:request_specs => true
    	g.fixture_replacement :factory_girl, :dir => "spec/factories"
    end

    #config.force_ssl = true
    
  end
end
