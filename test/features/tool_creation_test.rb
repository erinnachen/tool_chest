require "test_helper"

class ToolCreationTest < ActionDispatch::IntegrationTest
  test "user can create a tool" do
    user = create_new_user
    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit new_tool_path
    fill_in "Name", with: "Screwdriver"
    fill_in "Price", with: "1099"
    fill_in "Quantity", with: "10"
    click_link_or_button "Create Tool"

    tool = Tool.last
    save_and_open_page
    assert_equal "Screwdriver", tool.name
    assert_equal tool_path(Tool.last), current_path

    within(".tool_info") do
      assert page.has_content?("Screwdriver")
      assert page.has_content?("10.99")
      assert page.has_content?("10")
    end
  end
end
