ENV["RAILS_ENV"] ||= 'test'
# require 'simplecov'
# SimpleCov.start 'rails'
# puts 'required simplecov'

require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'capybara/rails'
require 'capybara/rspec'
require 'sunspot_test/rspec'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|

  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = false

  config.infer_base_class_for_anonymous_controllers = false

  config.order = "random"

  config.before :suite do
    DatabaseCleaner.strategy = :truncation
  end

  config.before :each do
    DatabaseCleaner.start
  end

  config.after :each do
    DatabaseCleaner.clean
  end

  OmniAuth.config.test_mode = true

  OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
    :provider => 'facebook',
    :uid => '12345',
    :info => {
      :nickname => 'bhorne',
      :email => 'ben@horne.com',
      :name => 'Ben Horne',
      :first_name => 'Ben',
      :last_name => 'Horne',
      :image => 'http://graph.facebook.com/1234567/picture?type=square',
      :urls => { :Facebook => 'http://www.facebook.com/jbloggs' },
      :location => 'Denver, Colorado',
      :verified => true
    },
    :credentials => {
      :token => 'ABCDEF...', # OAuth 2.0 access_token, which you may wish to store
      :expires_at => 1521747205, # when the access token expires (it always will)
      :expires => true # this will always be true
    },
    :extra => {
      :raw_info => {
        :id => '1234567',
        :name => 'Ben Horne',
        :first_name => 'Ben',
        :last_name => 'Horne',
        :link => 'http://www.facebook.com/benhorne44',
        :username => 'benhorne',
        :location => { :id => '123456789', :name => 'Denver, Colorado' },
        :gender => 'male',
        :email => 'ben@horne.com',
        :timezone => -8,
        :locale => 'en_US',
        :verified => true,
        :updated_time => '2011-11-11T06:21:03+0000'
      }
    }
  })
end

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, :phantomjs => Phantomjs.path)
end

Capybara.javascript_driver = :poltergeist

def login
  Koala::Facebook::API.any_instance.stub(:get_picture).and_return('/')
  Koala::Facebook::API.any_instance.stub(:get_connection).and_return([])
  User.any_instance.stub(:all_friends).and_return([])
  User.any_instance.stub(:friend_reviews).and_return([])
  Friend.any_instance.stub(:picture_url).and_return('/')
  visit root_path
  click_on "Login With Facebook"
end
