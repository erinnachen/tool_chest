ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL

  def create_new_user
    visit new_user_path
    fill_in_username_and_password
    click_on "Create Account"
  end

  def fill_in_username_and_password
    fill_in "Username", with: "capybaracrawler"
    fill_in "Password", with: "securepassword"
  end

  def teardown
    reset_session!
  end

end
