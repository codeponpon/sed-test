gibbon = Gibbon::Request.new(api_key: ENV['MAILCHIMP_API_KEY'])
gibbon.timeout = 25
gibbon.open_timeout = 30
gibbon.throws_exceptions = true