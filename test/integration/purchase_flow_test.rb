require 'test_helper'

class PurchaseFlowTest < ActionDispatch::IntegrationTest
  def setup
     @banana = products(:banana)
     @apple = products(:apple)
     @cartA = carts(:cartA)
     @cartB = carts(:cartB)
  end

  test "validate checkout total" do
    get "/order", params: {productName: @banana.name,
      cartName: @cartA.name, amount: 2}
    get '/buy',  params: {cartName: @cartA.name}

    assert_equal @banana.price*2, json_response['total'].to_i
  end

  test "check invalid purchases" do
    get "/order", params: {productName: @apple.name,
      cartName: @cartA.name, amount: 2}

    assert_no_difference 'CartsProduct.count' do
      get '/buy',  params: {cartName: @cartA.name}
    end
  end

  test "check product inventory does not change before checking out" do
    #Check inventory does not change before buying
    get "/order", params: {productName: @banana.name,
      cartName: @cartA.name, amount: 2}
    get "/product", params: {name: @banana.name}
    assert_equal @bannana.inventory, json_response['product']['inventory']._to_i

    #Check that buying will change inventory
    get '/buy',  params: {cartName: @cartA.name}
    get "/product", params: {name: @banana.name}
    assert_equal @bannana.inventory - 2, json_response['product']['inventory']._to_i
  end
end
