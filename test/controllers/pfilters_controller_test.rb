require 'test_helper'

class PfiltersControllerTest < ActionController::TestCase
  setup do
    @pfilter = pfilters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pfilters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pfilter" do
    assert_difference('Pfilter.count') do
      post :create, pfilter: { email: @pfilter.email, pfilter: @pfilter.pfilter }
    end

    assert_redirected_to pfilter_path(assigns(:pfilter))
  end

  test "should show pfilter" do
    get :show, id: @pfilter
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pfilter
    assert_response :success
  end

  test "should update pfilter" do
    patch :update, id: @pfilter, pfilter: { email: @pfilter.email, pfilter: @pfilter.pfilter }
    assert_redirected_to pfilter_path(assigns(:pfilter))
  end

  test "should destroy pfilter" do
    assert_difference('Pfilter.count', -1) do
      delete :destroy, id: @pfilter
    end

    assert_redirected_to pfilters_path
  end
end
