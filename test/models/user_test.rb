require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should have_many :tools
  should validate_presence_of :username
  should validate_uniqueness_of :username
end
