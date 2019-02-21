Instagram.configure do |config|
  config.client_id = ENV['INSTAGRAM_APP_ID']
  config.client_secret = ENV['INSTAGRAM_APP_SECRET']
  config.access_token = ENV['INSTAGRAM_ACCESS_TOKEN']
  # For secured endpoints only
  #config.client_ips = '<Comma separated list of IPs>'
end