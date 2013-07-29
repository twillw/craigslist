require 'test_helper'
require 'minitest/pride'

class UsersControllerTest < ActionController::TestCase
  setup do
  	@user = users(:one)
  	@update = {
  	    name: 		  'Ronald Victorino'
  		email: 		  'ronaldvictorino@gmail.com'
  		password: 	  'password'
  		phone_number: '(416)457-9037'
  	}
  end

  #new
  test "should get users new" do
    get :new
    assert_response :success
  end

  #create
  test "should create a new user" do
    skip
    post :create
    assert_response :success
    assert_difference('User.count') do
      post :create, user: @update
    end
    assert_redirect_to user_path(assigns(:user))
  end

  #show
  test "should show user" do
    get :show, id: @user
    assert_response :success
    #write a test that ensures that all of their ads are up?
  end

  #edit
  test "should get edit" do
  	get :edit, id: @user
  	assert_response :success
  end

  #update
  test "should update user" do
  	patch :update, id: @user, user: @update
  	assert_redirected_to user_path(assigns(:user))
  end

  #should be able to destroy your profile
  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end
    assert_redirected_to users_path
  end

  #should not create or update user with bad data
	  test "should not be able to create user with bad data" do
	    assert @user[:name] != nil
	    assert @user[:email] != nil
	    assert @user[:password] != nil
	    assert @user[:phone_number] != nil
	  end

	  test "should not be able to update user info w/ bad data" do
	    @update[:name] = nil
	    patch :update, id: @user, user: @update
	    assert_response :error
	  end
end
