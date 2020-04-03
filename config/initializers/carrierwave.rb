unless Rails.env.development? || Rails.env.test?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      # udemy_zeroのアクセスキーとシークレットアクセスキー
      aws_access_key_id: Settings.aws[:access_key_id],
      aws_secret_access_key: Settings.aws[:secret_access_key],
      region: 'ap-northeast-1'
    }

    # s3バケット名
    config.fog_directory  = 'my-youtube-space-s3'
    config.cache_storage = :fog
  end
end