require 'test_helper'

class PurchaseFlowTest < ActionDispatch::IntegrationTest
  test "validate checkout total" do
    get "/order", params: {productName: @banana.name,
      cartName: @cartA.name, amount: 2}
    get '/buy',  params: {cartName: @cartA.name}

    assert_equal @banana.price*2, json_response['total'].to_i
  end
end
