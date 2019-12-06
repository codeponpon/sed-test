source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

ruby '2.4.1'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.1'
# Use sqlite3 as the database for Active Record
gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 3.12'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

# Include ApiGuardian from edge
gem 'api_guardian', git: 'https://github.com/codeponpon/api_guardian'
gem 'twilio-ruby'
gem 'apipie-rails'
gem 'gibbon'
gem 'mandrill-api'
gem 'redis'
gem 'resque', require: 'resque/server'
gem 'geokit-rails'
gem 'omise', github: 'omise/omise-ruby'
gem 'mini_magick'
gem 'barnes'
gem 'rotp', '>= 3.3.0', '< 4.0.0'
gem 'onesignal-ruby', github: 'codeponpon/onesignal-ruby'
gem 'puma_worker_killer'
gem 'r18n-rails'
gem 'postmark-rails'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
  gem 'pry-rails'
  gem 'pry-rescue'
  gem 'pry-stack_explorer'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'shoulda-matchers'
  gem 'rubocop'
  gem 'dotenv-rails'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'rails-erd'
  gem 'derailed'
end

group :test do
  gem 'database_cleaner'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'devise'
gem 'activeadmin', github: 'activeadmin'
gem 'active_skin', github: 'codeponpon/active_skin'
gem 'rmagick'
gem 'carrierwave'
gem 'carrierwave-aws'
# gem 'active_admin_paranoia'