require 'test_helper'

class PhilanthropiesControllerTest < ActionController::TestCase
  setup do
    @philanthropy = philanthropies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:philanthropies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create philanthropy" do
    assert_difference('Philanthropy.count') do
      post :create, philanthropy: { event_id_id: @philanthropy.event_id_id, total_raised: @philanthropy.total_raised }
    end

    assert_redirected_to philanthropy_path(assigns(:philanthropy))
  end

  test "should show philanthropy" do
    get :show, id: @philanthropy
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @philanthropy
    assert_response :success
  end

  test "should update philanthropy" do
    patch :update, id: @philanthropy, philanthropy: { event_id_id: @philanthropy.event_id_id, total_raised: @philanthropy.total_raised }
    assert_redirected_to philanthropy_path(assigns(:philanthropy))
  end

  test "should destroy philanthropy" do
    assert_difference('Philanthropy.count', -1) do
      delete :destroy, id: @philanthropy
    end

    assert_redirected_to philanthropies_path
  end
end
