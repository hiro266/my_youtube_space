require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module App
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    # rails g コマンドを使用した際に、assets、helper、testファイル、が生成されないように設定
    config.generators do |g|
      g.assets false
      g.helper false
    end
    # 日本語化
    config.i18n.default_locale = :ja # デフォルト言語を日本語に設定
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s] # i18n翻訳ファイル(ja.yml等)をlocales以下に配置することで読み込むことができるように設定
    # rails時刻設定
    config.time_zone = 'Asia/Tokyo'
    # db時刻設定
    config.active_record.default_timezone = :local
  end
end
