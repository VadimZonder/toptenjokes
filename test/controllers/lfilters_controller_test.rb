require 'test_helper'

class LfiltersControllerTest < ActionController::TestCase
  setup do
    @lfilter = lfilters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lfilters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lfilter" do
    assert_difference('Lfilter.count') do
      post :create, lfilter: { email: @lfilter.email, lfilter: @lfilter.lfilter }
    end

    assert_redirected_to lfilter_path(assigns(:lfilter))
  end

  test "should show lfilter" do
    get :show, id: @lfilter
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lfilter
    assert_response :success
  end

  test "should update lfilter" do
    patch :update, id: @lfilter, lfilter: { email: @lfilter.email, lfilter: @lfilter.lfilter }
    assert_redirected_to lfilter_path(assigns(:lfilter))
  end

  test "should destroy lfilter" do
    assert_difference('Lfilter.count', -1) do
      delete :destroy, id: @lfilter
    end

    assert_redirected_to lfilters_path
  end
end
