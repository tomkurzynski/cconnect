require 'test_helper'

class ShippingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shipping = shippings(:one)
  end

  test "should get index" do
    get shippings_url
    assert_response :success
  end

  test "should get new" do
    get new_shipping_url
    assert_response :success
  end

  test "should create shipping" do
    assert_difference('Shipping.count') do
      post shippings_url, params: { shipping: { Line_1: @shipping.Line_1, Line_2: @shipping.Line_2, Line_3: @shipping.Line_3 } }
    end

    assert_redirected_to shipping_url(Shipping.last)
  end

  test "should show shipping" do
    get shipping_url(@shipping)
    assert_response :success
  end

  test "should get edit" do
    get edit_shipping_url(@shipping)
    assert_response :success
  end

  test "should update shipping" do
    patch shipping_url(@shipping), params: { shipping: { Line_1: @shipping.Line_1, Line_2: @shipping.Line_2, Line_3: @shipping.Line_3 } }
    assert_redirected_to shipping_url(@shipping)
  end

  test "should destroy shipping" do
    assert_difference('Shipping.count', -1) do
      delete shipping_url(@shipping)
    end

    assert_redirected_to shippings_url
  end
end
