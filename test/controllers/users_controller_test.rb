require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should get users new" do
    get :new
    assert_response :success
  end
  
end
