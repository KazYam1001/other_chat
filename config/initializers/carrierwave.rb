require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|

  config.storage = :fog
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: Rails.application.credentials.aws[:access_key_id],
    aws_secret_access_key: Rails.application.credentials.aws[:secret_access_key],
    # aws_access_key_id: ENV['OC_AWS_ACCESS_KEY'],
    # aws_secret_access_key: ENV['OC_AWS_SECRET'],
    region: 'ap-northeast-1'
  }
  config.fog_directory  = 'yamprochat'
  config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/yamprochat'
  # if Rails.env.production?
  # else
  #   config.storage :file
  # end

end
