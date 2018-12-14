require 'test_helper'

class OrderListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order_list = order_lists(:one)
  end

  test "should get index" do
    get order_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_order_list_url
    assert_response :success
  end

  test "should create order_list" do
    assert_difference('OrderList.count') do
      post order_lists_url, params: { order_list: { order: @order_list.order, order_array: @order_list.order_array } }
    end

    assert_redirected_to order_list_url(OrderList.last)
  end

  test "should show order_list" do
    get order_list_url(@order_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_list_url(@order_list)
    assert_response :success
  end

  test "should update order_list" do
    patch order_list_url(@order_list), params: { order_list: { order: @order_list.order, order_array: @order_list.order_array } }
    assert_redirected_to order_list_url(@order_list)
  end

  test "should destroy order_list" do
    assert_difference('OrderList.count', -1) do
      delete order_list_url(@order_list)
    end

    assert_redirected_to order_lists_url
  end
end
