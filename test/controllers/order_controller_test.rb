require 'test_helper'

class OrderControllerTest < ActionDispatch::IntegrationTest
  def setup
     @bannana = products(:bannana)
     @apple = products(:apple)
     @cartA = carts(:cartA)
     @cartB = carts(:cartB)
  end

  test "Add a valid item to order" do
    assert_difference 'Order.count', 1 do
      get "/order", params: {product: @bannana, cart: cartA}
    end
  end

  test "Add a invalid item to order" do
    assert_no_difference 'Order.count' do
      get "/order", params: {product: @bannana, cart: nil}
    end
  end

  test "Add a order which is out of stock" do
    assert_no_difference 'Order.count' do
      get "/order", params: {product: @apple, cart: cartB}
    end
  end
end
