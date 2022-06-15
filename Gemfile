source 'https://rubygems.org'
ruby '2.7.6'

gem 'rails', '~> 5.2.8'

gem 'puma'

gem 'sass-rails'
gem 'uglifier'
gem 'coffee-rails'
gem 'jquery-rails'
gem 'jbuilder'

gem 'bcrypt'

gem 'foundation-rails'
gem 'font-awesome-rails'

gem 'figaro'
gem 'mail'

gem 'pundit'

gem 'sprockets-es6'

group :development, :test, :ci do
  gem 'byebug', platform: :mri
  gem 'rails_best_practices'
  gem 'rubocop'
  gem 'rubocop-rspec'
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'rails-controller-testing'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'ffaker'
  gem 'debase'
  gem 'ruby-debug-ide'
end

group :development do
  gem 'sqlite3'
  gem 'web-console'
  gem 'brakeman'
  gem 'bundler-audit'
end

group :test, :ci do
  gem 'capybara'
  gem 'shoulda-matchers'
  gem 'capybara-email', '~> 2.5'
  gem 'simplecov', '~> 0.21.2', require: false
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end
