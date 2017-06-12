CarrierWave.configure do |config|
  #config.fog_provider = 'fog/aws'
  config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => ENV['S3_KEY'],
      :aws_secret_access_key  => ENV['S3_SECRET'],
      :region                 => 'eu-central-1',					                  #ENV['S3_REGION'] # Change this for different AWS region. Default is 'us-east-1'
      :host                   => 's3.eu-central-1.amazonaws.com',           # optional, defaults to nil
      :endpoint               => 'https://s3.eu-central-1.amazonaws.com/'   # optional, defaults to nil
  }
  config.fog_directory  = 'freeads'
  config.cache_dir     = "#{Rails.root}/tmp/uploads"
end