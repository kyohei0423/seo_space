CarrierWave.configure do |config|
  config.storage = :fog
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: Settings.aws[:access_key],
    aws_secret_access_key: Settings.aws[:secret_access],
    region: Settings.aws[:region]
  }

    case Rails.env
    when 'development'
        config.fog_directory  = Settings.aws[:backet]
        config.asset_host = Settings.aws[:asset_host]
    when 'production'
      config.fog_directory  = Settings.aws[:backet]
      config.asset_host = Settings.aws[:asset_host]
    end
end
