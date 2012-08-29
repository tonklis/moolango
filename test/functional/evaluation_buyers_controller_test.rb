require 'test_helper'

class EvaluationBuyersControllerTest < ActionController::TestCase
  setup do
    @evaluation_buyer = evaluation_buyers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:evaluation_buyers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create evaluation_buyer" do
    assert_difference('EvaluationBuyer.count') do
      post :create, evaluation_buyer: @evaluation_buyer.attributes
    end

    assert_redirected_to evaluation_buyer_path(assigns(:evaluation_buyer))
  end

  test "should show evaluation_buyer" do
    get :show, id: @evaluation_buyer.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @evaluation_buyer.to_param
    assert_response :success
  end

  test "should update evaluation_buyer" do
    put :update, id: @evaluation_buyer.to_param, evaluation_buyer: @evaluation_buyer.attributes
    assert_redirected_to evaluation_buyer_path(assigns(:evaluation_buyer))
  end

  test "should destroy evaluation_buyer" do
    assert_difference('EvaluationBuyer.count', -1) do
      delete :destroy, id: @evaluation_buyer.to_param
    end

    assert_redirected_to evaluation_buyers_path
  end
end
