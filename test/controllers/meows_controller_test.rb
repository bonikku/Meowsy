require "test_helper"

class MeowsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get meows_index_url
    assert_response :success
  end

  test "should get create" do
    get meows_create_url
    assert_response :success
  end

  test "should get destroy" do
    get meows_destroy_url
    assert_response :success
  end
end
