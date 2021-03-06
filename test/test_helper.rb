ENV['RAILS_ENV'] ||= 'test'
require 'simplecov'
SimpleCov.start "rails"

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'
require 'mocha/mini_test'

class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL

  def create_new_user
    visit new_user_path
    fill_in_username_and_password
    click_on "Create Account"
  end

  def create_user
    User.create(username: "capybaracrawler", password: "securepassword")
  end

  def fill_in_username_and_password
    fill_in "Username", with: "capybaracrawler"
    fill_in "Password", with: "securepassword"
  end

  def login_user
    visit login_path
    fill_in_username_and_password
    click_on "Login"
  end

  def teardown
    reset_session!
    super
  end

end
