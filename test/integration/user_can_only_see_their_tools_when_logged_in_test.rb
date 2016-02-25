require 'test_helper'

class UserCanOnlySeeTheirToolsWhenLoggedInTest < ActionDispatch::IntegrationTest
  test "user can see only their tools after login" do
    u1 = create_user
    u2 = User.create(username: "kesha", password: "pa$$word")
    cat = Category.create(name: "hand tools")
    u1.tools << Tool.new(name: "Hammer", price: 1999, quantity: 5, category_id: cat.id)
    u1.tools << Tool.new(name: "Screwdriver", price: 600, quantity: 25, category_id: cat.id)
    u2.tools << Tool.new(name: "Nail gun", price: 3900, quantity: 2, category_id: cat.id)

    login_user

    assert page.has_content? "capybaracrawler"

    within ("#tools") do
      assert page.has_content? "Hammer"
      assert page.has_content? "Screwdriver"
    end
    refute page.has_content? "Nail gun"
  end
end
