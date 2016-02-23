require 'test_helper'

class UserCanLogoutTest < ActionDispatch::IntegrationTest
  test "user no longer sees name after logout" do
    create_new_user

    click_on "Logout"

    refute page.has_content?("capybaracrawler")
  end
end
