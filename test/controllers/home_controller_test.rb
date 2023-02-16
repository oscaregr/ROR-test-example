require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  
  setup do
    login
  end

  test "get home page" do
    get home_index_path

    assert_response :success
  end
end
