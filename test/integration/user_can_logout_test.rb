require 'test_helper'

class UserCanLogoutTest < ActionDispatch::IntegrationTest
  test "user no longer sees name after logout" do
    user = create_user
    login_user

    visit user_path(user)
    click_on "Logout"

    refute page.has_content?("capybaracrawler")
  end
end
