Apipie.configure do |config|
  config.languages = ['en']
  config.default_locale = 'en'
  config.locale = lambda { |loc| loc ? I18n.locale = loc : I18n.locale }
  config.translate = lambda do |str, loc|
    return '' if str.blank?
  end
  config.app_name                = "SEDIGITAL"
  config.api_base_url            = "/auth"
  config.doc_base_url            = "/apidoc"
  # where is your API defined?
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/**/*.rb"

  config.authenticate = Proc.new do
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["AUTH_USER"] && password == ENV["AUTH_SECRET"]
    end
  end
end
