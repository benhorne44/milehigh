source 'https://rubygems.org'
gem 'rails', '4.0.2'
gem 'pg'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'jbuilder', '~> 1.2'
gem 'travis'
gem 'puma'
gem 'omniauth-facebook'
gem "koala", "~> 1.8.0rc1"

gem 'rolling_paper'
gem 'leafly', path: './engines/Leafly'

group :development, :test do
  gem 'jazz_hands', github: 'nixme/jazz_hands', branch: 'bring-your-own-debugger'
  gem 'pry-byebug'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'quiet_assets'
  gem 'database_cleaner'
  gem 'cane'
  gem 'reek'
  gem 'brakeman', :require => false
  gem 'guard'
  gem 'guard-rspec'
  gem 'guard-cane'
  gem 'guard-reek', git: 'git://github.com/pericles/guard-reek.git'
  gem 'guard-brakeman'
  gem 'yaml_db', github: 'jetthoughts/yaml_db', ref: 'fb4b6bd7e12de3cffa93e0a298a1e5253d7e92ba'

end

group :test do
  gem 'selenium-webdriver'
  gem "capybara-webkit", "~> 1.1.1"
  gem 'poltergeist'
  gem 'rspec-rails'
  gem 'simplecov', :require => false, :group => :test
  gem 'database_cleaner', :require => false, :group => :test
  gem 'capybara'
  gem 'factory_girl_rails', '~> 4.0'
end

group :production do
  gem 'rails_12factor'
end
