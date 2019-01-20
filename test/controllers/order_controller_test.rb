#      ssstevenstapleton@gmail.com
#      Order controller tests
#      Purpose: Demonstrate the functionality of orders amd catch regression

require 'test_helper'

class OrderControllerTest < ActionDispatch::IntegrationTest
  def setup
     @banana = products(:banana)
     @apple = products(:apple)
     @cartA = carts(:cartA)
     @cartB = carts(:cartB)
  end

  test "Add a valid item to order" do
    assert_difference 'CartsProduct.count', 1 do
      get "/order", params: {productName: @banana.name,
        cartName: @cartA.name, amount: 1}
    end
  end

  test "Add a invalid item to order" do
    assert_no_difference 'CartsProduct.count' do
      get "/order", params: {productName: @banana.name,
        cartName: @cartA.name, amount: nil}
    end
  end

  test "Add a order which is out of stock" do
    assert_no_difference 'CartsProduct.count' do
      get "/order", params: {productName: @apple.name,
        cartName: @cartB.name, amount: 1}
    end
  end
end
