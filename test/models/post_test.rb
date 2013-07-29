require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  @post = posts(:one)
  @update_post = {
  	title: "harman's new post"
  	price: 10.00
  	body: "harman created a new post through tests"
  	location: "Ottawa"
  }


  test 'there should be an index action' do 
  	get :index
  	assert_response :success
  	assert_not_nil assigns(:posts) #ensures that a posts instance variable was set
  end


  test 'there should be a new post action' do 
  	get :new
  	assert_response :success
  end

  test 'should create a new post' do 
  	assert_difference('Post.count') do 
  		post :create, post: @update_post
  	end
  	assert_redirected_to post_path(assigns(:post)) #redirects to the show the newly created post
  end

  # test 'should not create a new post unless associated with a user' do
  # 	bad_post = @update_post
  # 	bad_post[user_id] = nil
  # 	should raise some kind of error
  
  # end

  test 'should update the post' do 
  	patch :update, id: @post, post: @update
  	assert_redirected_to post_path(assigns(:post))
  end

  test 'should destroy post' do
  	assert_difference('Post.count', -1) do 
  		# session[:post_id] = @post.id --> what is the point of sessions here?
  		delete :destroy, id: @post
  	end
  	assert_redirected_to user_path
  end
  	
  end

end

