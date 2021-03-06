require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PropertyApp
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    
    config.generators do |g|
        g.assets false
    end

    config.autoload_paths += %W(#{config.root}/app/models/dtos)
    
    Paperclip.options[:command_path] = "C:\\Program Files\\ImageMagick-7.0.5-Q16\\"
  end
end
