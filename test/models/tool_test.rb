require 'test_helper'

class ToolTest < ActiveSupport::TestCase
  should belong_to :user
  should validate_presence_of :name
  should validate_presence_of :user
end
