require 'test_helper'

class UserCanCreateAnAccountTest < ActionDispatch::IntegrationTest
  test "user has a personal page after account creation" do
    visit '/'
    click_on "Create new account"
    fill_in_username_and_password
    click_on "Create Account"

    assert page.has_content?("capybaracrawler's tools:")
  end
end
