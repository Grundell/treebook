require 'test_helper'

class CustomTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  test "that /login route opens page" do
  	get '/login'

  	assert_response :success
  end

    test "that /logout route opens page" do
  	get '/logout'

  	assert_response :redirect 
  	assert_redirected_to '/' 
  end

	test "that /register route opens page" do
  	get '/register'

  	assert_response :success 
  end

  test "that a profile page works" do
    get '/jasonsifer'
    assert_response :success
  end

  # end
end
