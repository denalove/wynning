require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  # test "should get index" do
  # 	user = users(:one)
  #   get :index
  #   assert_response :success
  # end


end
