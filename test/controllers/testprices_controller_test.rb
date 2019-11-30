require 'test_helper'

class TestpricesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @testprice = testprices(:one)
  end

  test "should get index" do
    get testprices_url
    assert_response :success
  end

  test "should get new" do
    get new_testprice_url
    assert_response :success
  end

  test "should create testprice" do
    assert_difference('Testprice.count') do
      post testprices_url, params: { testprice: { title: @testprice.title, value2: @testprice.value2, value: @testprice.value } }
    end

    assert_redirected_to testprice_url(Testprice.last)
  end

  test "should show testprice" do
    get testprice_url(@testprice)
    assert_response :success
  end

  test "should get edit" do
    get edit_testprice_url(@testprice)
    assert_response :success
  end

  test "should update testprice" do
    patch testprice_url(@testprice), params: { testprice: { title: @testprice.title, value2: @testprice.value2, value: @testprice.value } }
    assert_redirected_to testprice_url(@testprice)
  end

  test "should destroy testprice" do
    assert_difference('Testprice.count', -1) do
      delete testprice_url(@testprice)
    end

    assert_redirected_to testprices_url
  end
end
