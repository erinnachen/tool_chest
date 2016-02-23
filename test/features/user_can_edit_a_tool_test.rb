require 'test_helper'

class UserCanEditAToolTest < ActionDispatch::IntegrationTest
  test "user can edit an existing tool" do
    tool = Tool.create(name: "Hammer", price: 2999, quantity: 3)
    visit edit_tool_path(tool.id)

    fill_in "Name", with: "Wrench"
    fill_in "Quantity", with: "30"
    fill_in "Price", with: "899"
    click_button "Update Tool"

    assert_equal tool_path(tool.id), current_path

    within(".tool_info") do
      assert page.has_content?("Wrench")
      assert page.has_content?("30")
      assert page.has_content?("8.99")
    end
  end
end
