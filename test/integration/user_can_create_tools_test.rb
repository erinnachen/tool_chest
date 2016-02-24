require 'test_helper'

class UserCanCreateToolsTest < ActionDispatch::IntegrationTest
  test "user sees tool on page after new tool created" do
    user = User.create(username: "capybaracrawler", password:"securepassword")
    login_user

    click_on "Create New Tool"
    fill_in "Name", with: "Table saw"
    fill_in "Price", with: 345
    fill_in "Quantity", with: 10
    click_on "Create Tool"

    tool = user.tools.last
    assert_equal user_tool_path(tool), current_path
    click_on "Back to capybaracrawler's tools"

    assert page.has_content? "Newest tool: Table saw"
    assert page.has_content? "Current tool count: 10"
    assert page.has_content? "Current potential revenue: $34.50"

    within ".tools" do
      assert page.has_content? "Table saw"
    end
  end
end
