require 'test_helper'

class HintsControllerTest < ActionController::TestCase
  setup do
    @hint = hints(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hints)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hint" do
    assert_difference('Hint.count') do
      post :create, hint: @hint.attributes
    end

    assert_redirected_to hint_path(assigns(:hint))
  end

  test "should show hint" do
    get :show, id: @hint.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hint.to_param
    assert_response :success
  end

  test "should update hint" do
    put :update, id: @hint.to_param, hint: @hint.attributes
    assert_redirected_to hint_path(assigns(:hint))
  end

  test "should destroy hint" do
    assert_difference('Hint.count', -1) do
      delete :destroy, id: @hint.to_param
    end

    assert_redirected_to hints_path
  end
end
