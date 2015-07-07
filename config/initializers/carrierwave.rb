CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:              'AWS',
    aws_access_key_id:     Rails.application.secrets.aws_access_key,
    aws_secret_access_key: Rails.application.secrets.aws_secret_access_key,
  }
  config.storage = (Rails.env.production? || Rails.env.staging?) ? :fog : :file
  config.enable_processing = !(Rails.env.test?)
  config.fog_directory  = Rails.application.secrets.aws_bucket_name
  config.fog_attributes = {
    'Cache-Control'=>"max-age=#{365.days.to_i}"
  }
end
