#      ssstevenstapleton@gmail.com
#      Cart test
#      Purpose: Demonstrate the validations for the cart model 

require 'test_helper'

class CartTest < ActiveSupport::TestCase
  def setup
    @cart = Cart.new(name: "Bannana", total: 0)
  end

  test "valid cart" do
    assert @cart.valid?
  end

  test "carts should be unique" do
    duplicate_cart = @cart.dup
     duplicate_cart.name = @cart.name.upcase
     @cart.save
     assert_not duplicate_cart.valid?
  end

  test "check if we can add a cart without a name" do
    @cart.name = "     "
    assert_not @cart.valid?
  end

  test "check if name is too long" do
    @cart.name = "This name for a product is way too long for meeeee"
    assert_not @cart.valid?
  end
end
