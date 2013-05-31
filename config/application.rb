require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
# require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module TumayunCom
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'
    config.time_zone = 'Beijing'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
    config.i18n.default_locale = 'zh-CN'

    # Enable escaping HTML in JSON.
    config.active_support.escape_html_entities_in_json = true

    # 去掉不需要的middlewares
    config.middleware.delete 'Rack::Cache'  # page cache 不需要
    #config.middleware.delete 'Rack::Runtime'  # 执行时间
    config.middleware.delete 'ActionDispatch::RequestId'  # X-Request-Id
    config.middleware.delete 'ActionDispatch::RemoteIp'   # IP 欺骗攻击,只有在用IP做权限的时候需要
    config.middleware.delete 'ActionDispatch::Callbacks'  # 每次请求的callbacks
    config.middleware.delete 'ActionDispatch::Head'       # HEAD 请求
    config.middleware.delete 'ActionDispatch::BestStandardsSupport' # X-UA-Compatible
  end

  I18n.locale = 'zh-CN'
end
