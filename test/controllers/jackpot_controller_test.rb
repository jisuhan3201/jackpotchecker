require 'test_helper'

class JackpotControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get checker" do
    get :checker
    assert_response :success
  end

end
