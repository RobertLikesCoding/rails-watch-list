require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get :create" do
    get comments_:create_url
    assert_response :success
  end
end
