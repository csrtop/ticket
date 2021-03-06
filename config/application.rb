require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Ticket
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    
    config.load_defaults 5.1
    config.i18n.default_locale = :es
    config.time_zone = "Central Time (US & Canada)"
    
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  
    config.middleware.insert_before 0, Rack::Cors do
    	allow do
    		origins '*'
    		resource '*', headers: :any, methods: [:get, :patch, :delete, :post, :options]
    	end
    	
    end

  end

end
