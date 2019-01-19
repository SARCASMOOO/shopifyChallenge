require 'test_helper'

class CartControllerTest < ActionDispatch::IntegrationTest

  test "create a new cart" do
    assert_difference 'Cart.count', 1 do
      post "/cart", params: {name: "FirstCart"}
    end
  end

  test "create a new cart with too long of a name " do
    assert_no_difference 'Cart.count' do
      post "/cart", params: {name: "FirstCarttttttttttttttttttttttttttttttttt"}
    end
  end

  test "check checkout total" do
    #checkout
    assert false
  end
end
