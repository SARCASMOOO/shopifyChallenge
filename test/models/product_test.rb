require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  def setup
    @product = Product.new(name: "Bannana", price: 1.96, inventory: 3)
  end

  test "valid product" do
    assert @product.valid?
  end

  test "products should be unique" do
    duplicate_product = @product.dup
     duplicate_product.name = @product.name.upcase
     @product.save
     assert_not duplicate_product.valid?
  end

  test "check if we can add a product with a negative price or zero" do
    @product.price = -20
    assert_not @product.valid?
    @product.price = 0
    assert_not @product.valid?
  end

  test "check if we can add a product without a name, price, or quantity" do
    @product.name = "     "
    assert_not @product.valid?
    @product.price = nil
    assert_not @product.valid?
    @product.inventory = nil
    assert_not @product.valid?
  end

  test "check if name is too long" do
    @product.name = "This name for a product is way too long for meeeee"
    assert_not @product.valid?
  end
end
