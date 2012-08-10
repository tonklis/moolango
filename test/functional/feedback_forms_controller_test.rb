require 'test_helper'

class FeedbackFormsControllerTest < ActionController::TestCase
  setup do
    @feedback_form = feedback_forms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:feedback_forms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create feedback_form" do
    assert_difference('FeedbackForm.count') do
      post :create, feedback_form: @feedback_form.attributes
    end

    assert_redirected_to feedback_form_path(assigns(:feedback_form))
  end

  test "should show feedback_form" do
    get :show, id: @feedback_form.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @feedback_form.to_param
    assert_response :success
  end

  test "should update feedback_form" do
    put :update, id: @feedback_form.to_param, feedback_form: @feedback_form.attributes
    assert_redirected_to feedback_form_path(assigns(:feedback_form))
  end

  test "should destroy feedback_form" do
    assert_difference('FeedbackForm.count', -1) do
      delete :destroy, id: @feedback_form.to_param
    end

    assert_redirected_to feedback_forms_path
  end
end
