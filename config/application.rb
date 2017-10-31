require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module CheckListApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

      ActionMailer::Base.smtp_settings = {
      :address        => "smtp.gmail.com",
      :port           => 587,
      :domain         => "mail.google.com",
      :user_name      => "belovsallvatore@gmail.com",
      :password       => '9009177246kp0041pi0041',
      :authentication => 'login',
      :from          => 'admin',
      :enable_starttls_auto => true
  }
  end
end
