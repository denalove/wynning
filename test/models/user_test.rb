require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "email must be unique" do
    user = User.new(email: "ed@wyncode.co", password: "anything")
    assert_not user.save, "Hey, dummy...same email."
  end

  test "high level goal should not be nil" do
    user = users(:one)
    user.high_level_goal = nil
    assert_not user.save, "you need a goal in life, dummy"
    p user.errors.messages
  end

end
