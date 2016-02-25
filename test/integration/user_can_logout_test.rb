require 'test_helper'

class UserCanLogoutTest < ActionDispatch::IntegrationTest
  test "user no longer sees name after logout" do
    user = create_new_user
    visit '/'
    save_and_open_page
    click_on "Logout"

    refute page.has_content?("capybaracrawler")
  end
end
