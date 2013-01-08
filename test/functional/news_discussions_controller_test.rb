require 'test_helper'

class NewsDiscussionsControllerTest < ActionController::TestCase
  setup do
    @news_discussion = news_discussions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:news_discussions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create news_discussion" do
    assert_difference('NewsDiscussion.count') do
      post :create, news_discussion: @news_discussion.attributes
    end

    assert_redirected_to news_discussion_path(assigns(:news_discussion))
  end

  test "should show news_discussion" do
    get :show, id: @news_discussion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @news_discussion
    assert_response :success
  end

  test "should update news_discussion" do
    put :update, id: @news_discussion, news_discussion: @news_discussion.attributes
    assert_redirected_to news_discussion_path(assigns(:news_discussion))
  end

  test "should destroy news_discussion" do
    assert_difference('NewsDiscussion.count', -1) do
      delete :destroy, id: @news_discussion
    end

    assert_redirected_to news_discussions_path
  end
end
