require 'test_helper'

class UserCanOnlySeeTheirToolsWhenLoggedInTest < ActionDispatch::IntegrationTest
  test "user sees only their tools" do
    u1 = User.create(username: "capybaracrawler", password: "securepassword")
    u2 = User.create(username: "kesha", password: "pa$$word")
    u1.tools << Tool.new(name: "Hammer", price: 1999, quantity: 5)
    u1.tools << Tool.new(name: "Screwdriver", price: 600, quantity: 25)
    u2.tools << Tool.new(name: "Nail gun", price: 3900, quantity: 2)

    visit login_path
    fill_in_username_and_password
    click_on "Login"

    assert page.has_content? "capybaracrawler"
    within ("#tools") do
      u1.tools.each do |tool|
        assert page.has_content? tool.name
      end
    end
    refute page.has_content? "Nail gun"
  end
end
