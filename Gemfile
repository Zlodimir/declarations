source 'https://rubygems.org'

gem 'rails', '4.2.1'
gem 'sass-rails', '~> 5.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'pg'
gem 'sprockets', '~> 2.8'
gem 'bootstrap-sass', '~> 3.3'
gem 'slim-rails'
gem 'devise'
gem 'omniauth-facebook'
gem 'font-awesome-sass', '~> 4.3.0'
gem 'jquery-ui-rails'
gem 'social-share-button'
gem 'backoffice', path: 'engines/backoffice'

group :development do
  gem 'spring'
  gem 'capistrano'
  gem 'capistrano-rvm'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
end

group :staging do
  gem 'unicorn'
end

group :test do
  gem 'capybara-webkit'
  gem 'shoulda'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

