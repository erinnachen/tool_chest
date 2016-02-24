require 'test_helper'

class UserCanEditExistingToolTest < ActionDispatch::IntegrationTest
  test "user sees updated tool after changing all fields" do
    create_user
    u1 = User.last
    tool1 = Tool.new(name: "Hammer", price: 1999, quantity: 5)
    tool2 = Tool.new(name: "Screwdriver", price: 600, quantity: 25)
    u1.tools << tool1
    u1.tools << tool2
    login_user

    visit user_tool_path(tool1)
    click_on "Edit Hammer"
    fill_in "Name", with: "Bolt Cutters"
    fill_in "Price", with: 3999
    fill_in "Quantity", with: 2
    click_on "Update Tool"
    
    save_and_open_page
    assert_equal user_tool_path(tool1), current_path
    within (".tool_info") do
      refute page.has_content? "Hammer"
      assert page.has_content? "Bolt Cutters - 2"
      assert page.has_content? "Price: $39.99"
    end
  end
end
