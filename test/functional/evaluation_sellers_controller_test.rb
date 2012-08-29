require 'test_helper'

class EvaluationSellersControllerTest < ActionController::TestCase
  setup do
    @evaluation_seller = evaluation_sellers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:evaluation_sellers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create evaluation_seller" do
    assert_difference('EvaluationSeller.count') do
      post :create, evaluation_seller: @evaluation_seller.attributes
    end

    assert_redirected_to evaluation_seller_path(assigns(:evaluation_seller))
  end

  test "should show evaluation_seller" do
    get :show, id: @evaluation_seller.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @evaluation_seller.to_param
    assert_response :success
  end

  test "should update evaluation_seller" do
    put :update, id: @evaluation_seller.to_param, evaluation_seller: @evaluation_seller.attributes
    assert_redirected_to evaluation_seller_path(assigns(:evaluation_seller))
  end

  test "should destroy evaluation_seller" do
    assert_difference('EvaluationSeller.count', -1) do
      delete :destroy, id: @evaluation_seller.to_param
    end

    assert_redirected_to evaluation_sellers_path
  end
end
