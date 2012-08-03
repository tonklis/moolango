require 'test_helper'

class EarnerFormsControllerTest < ActionController::TestCase
  setup do
    @earner_form = earner_forms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:earner_forms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create earner_form" do
    assert_difference('EarnerForm.count') do
      post :create, earner_form: @earner_form.attributes
    end

    assert_redirected_to earner_form_path(assigns(:earner_form))
  end

  test "should show earner_form" do
    get :show, id: @earner_form.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @earner_form.to_param
    assert_response :success
  end

  test "should update earner_form" do
    put :update, id: @earner_form.to_param, earner_form: @earner_form.attributes
    assert_redirected_to earner_form_path(assigns(:earner_form))
  end

  test "should destroy earner_form" do
    assert_difference('EarnerForm.count', -1) do
      delete :destroy, id: @earner_form.to_param
    end

    assert_redirected_to earner_forms_path
  end
end
