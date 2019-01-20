#      ssstevenstapleton@gmail.com
#      Cart controller tests
#      Purpose: Demonstrate the functionality of a cart amd catch regression

require 'test_helper'

class CartControllerTest < ActionDispatch::IntegrationTest
  def setup
     @banana = products(:banana)
     @apple = products(:apple)
     @cartA = carts(:cartA)
     @cartB = carts(:cartB)
  end

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
end
