require 'test_helper'

class StaticpageControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get staticpage_new_url
    assert_response :success
  end

  test "should get index" do
    get staticpage_index_url
    assert_response :success
  end

  test "should get show" do
    get staticpage_show_url
    assert_response :success
  end

end
