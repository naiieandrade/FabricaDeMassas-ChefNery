require 'test_helper'

class OrderItemsControllerTest < ActionController::TestCase
  setup do
    log_in(users(:one))
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get update" do
    get :update
    assert_response :success
  end

  test "should get destroy" do
    get :destroy
    assert_response :success
  end

end
