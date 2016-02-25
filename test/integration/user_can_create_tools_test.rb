require 'test_helper'

class UserCanCreateToolsTest < ActionDispatch::IntegrationTest
  test "user sees tool on page after new tool created" do
    user = create_user
    login_user

    visit user_path(user)
    click_on "Create New Tool"
    fill_in "Name", with: "Table saw"
    fill_in "Price", with: 345
    fill_in "Quantity", with: 10
    click_on "Create Tool"

    click_on "Back to capybaracrawler's tools"

    assert page.has_content? "Newest tool: Table saw"
    assert page.has_content? "Current tool count: 10"
    assert page.has_content? "Current potential revenue: $34.50"

    within "#tools" do
      assert page.has_content? "Table saw"
    end
  end
end
