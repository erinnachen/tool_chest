require 'test_helper'

class UserCanOnlySeeTheirToolsWhenLoggedInTest < ActionDispatch::IntegrationTest
  test "user can see only their tools after login" do
    u1 = create_user
    u2 = User.create(username: "kesha", password: "pa$$word")
    u1.tools << Tool.new(name: "Hammer", price: 1999, quantity: 5)
    u1.tools << Tool.new(name: "Screwdriver", price: 600, quantity: 25)
    u2.tools << Tool.new(name: "Nail gun", price: 3900, quantity: 2)

    login_user

    assert page.has_content? "capybaracrawler"
    within ("#tools") do
      assert page.has_content? "Hammer"
      assert page.has_content? "Screwdriver"
    end
    refute page.has_content? "Nail gun"
  end
end
