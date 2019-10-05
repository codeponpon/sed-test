require 'onesignal'

OneSignal.configure do |config|
  logger = ActiveSupport::Logger.new(STDOUT)
  config.app_id = ENV['ONESIGNAL_APP_ID']
  config.api_key = ENV['ONESIGNAL_REST_API_KEY']
  config.api_url = ENV['ONESIGNAL_API_URL']
  config.active = true
  config.logger = ActiveSupport::TaggedLogging.new(logger)
end