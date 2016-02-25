require 'test_helper'

class UserCannotViewOtherUserToolsTest < ActionDispatch::IntegrationTest
  test "user gets error page if tries to access a tool that is not theirs" do
    user = create_user
    cat = Category.create(name: "hand tools")
    u2 = User.create(username: "kesha", password: "pa$$word")
    cat = Category.create(name: "hand tools")
    user.tools << Tool.new(name: "Hammer", price: 1999, quantity: 5, category_id: cat.id)
    user.tools << Tool.new(name: "Screwdriver", price: 600, quantity: 25, category_id: cat.id)
    u2.tools << Tool.new(name: "Nail gun", price: 3900, quantity: 2, category_id: cat.id)
    login_user
    tool = Tool.last
    assert_equal u2.id, tool.user.id

    visit "/tools/#{tool.id}"

    assert page.has_content? "The page you were looking for doesn't exist"
  end
end
