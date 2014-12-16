source 'http://rubygems.org'

ruby '2.0.0'

gem 'rails', '4.1.8'

gem 'pg'
gem 'state_machine'
gem 'paperclip', '~> 4.1.1'
gem 'schema_plus'
gem 'hstore_translate'

# Controller related
gem 'responders'

# Authentication and authorization
gem 'devise'
gem 'pundit'

# I18n
gem 'devise-i18n'
gem 'devise-i18n-views', github: 'mcasimir/devise-i18n-views'
gem 'rails-i18n', github: 'svenfuchs/rails-i18n', branch: 'master'
gem 'routing-filter', '~> 0.4.0.pre'
gem 'world-flags'

# Views and assets
gem 'neat'
gem 'slim'
gem 'slim-rails'
gem 'normalize-rails'
gem 'sass-rails'
gem 'coffee-rails'
gem 'uglifier'
gem 'jquery-rails'
gem 'underscore-rails'
gem 'fb-channel-file'
gem 'active_decorator'
gem 'jbuilder'
gem 'icomoon-rails'
gem 'high_voltage'
gem 'maskmoney-rails'

# Other
gem 'aws-sdk'
gem 'rack-timeout'

group :test, :development do
  gem 'rspec-rails'
  gem "shoulda-matchers"
  gem 'letter_opener'
  gem 'spring'
end

group :production do
  # Workers, forks and all that jazz
  gem 'unicorn'
  # Enabling Gzip on Heroku
  # If you don't use Heroku, please comment the line below.
  gem 'heroku-deflater', '>= 0.4.1'
  # Monitoring with the new new relic
  gem 'newrelic_rpm'
  gem 'rails_12factor'
end
