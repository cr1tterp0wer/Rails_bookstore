require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get orders_url
    assert_response :success
  end

  test "should get new" do
    post line_items_url, params:{ product_id: products(:ruby).id }

    get new_order_url
    assert_response :success
  end

  test "should create order" do
    
    assert_difference('Order.count') do
      post orders_url, params: { order: { 
               name: 'Dave',
               address: 'my address 102',
               email: 'd@t.com',
               pay_type: 'Credit Card',
               payment_detail_type: 'CreditCard',
               credit_card_number: "123457890",
               expiration_date: "09/11"
               } }
    end
    assert_redirected_to store_index_url
  end

  test "should show order" do
    get order_url(@order)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_url(@order)
    assert_response :success
  end

  test "should update order" do
    params = { order: { 
               name: 'Dave',
               address: 'my address 102',
               email: 'd@t.com',
               pay_type: 'Credit Card',
               payment_detail_type: 'CreditCard',
               credit_card_number: "123457890",
               expiration_date: "09/11"
               } }
    patch order_url(@order), params: params
    assert_redirected_to order_url(@order)
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete order_url(@order)
    end

    assert_redirected_to orders_url
  end

  test "requires item in cart" do
    get new_order_url
    assert_redirected_to store_index_path
    assert_equal flash[:notice], 'Your cart is empty'
  end


end
