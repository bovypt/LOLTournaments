require "test_helper"

class ResultsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get results_new_url
    assert_response :success
  end

  test "should get create" do
    get results_create_url
    assert_response :success
  end

  test "should get edit" do
    get results_edit_url
    assert_response :success
  end

  test "should get update" do
    get results_update_url
    assert_response :success
  end
end
