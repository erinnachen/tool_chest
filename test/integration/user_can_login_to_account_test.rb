require 'test_helper'

class UserCanLoginToAccountTest < ActionDispatch::IntegrationTest
  test "user sees personal page after authorization" do
    create_new_user
    visit '/'
    click_on 'Login to existing account'
    fill_in_username_and_password
    click_on 'Login'

    assert page.has_content?("capybaracrawler's tools:")
  end
end
