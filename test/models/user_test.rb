require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "email must be unique" do
    user = User.new(email: "ed@wyncode.co", password: "anything")
    assert_not user.save, "Hey, dummy...same email."
  end
end
