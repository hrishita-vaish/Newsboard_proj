require 'test_helper'

class NewscategoryControllerTest < ActionController::TestCase
  test "should get latestnews_page" do
    get :latestnews_page
    assert_response :success
  end

  test "should get popularnews_page" do
    get :popularnews_page
    assert_response :success
  end

  test "should get businessnews_page" do
    get :businessnews_page
    assert_response :success
  end

  test "should get sportsnews_page" do
    get :sportsnews_page
    assert_response :success
  end
  test "should get description" do
    get :description
    assert_response :success
  end

end
