require 'test_helper'

class ProductControllerTest < ActionDispatch::IntegrationTest
  def setup
     @bannana = products(:bannana)
     @apple = products(:apple)
  end

  test "purchase too many apples" do
    assert false
  end

  test "purchase when product with no inventory" do
    assert false
  end

  test "purchase too much of a product" do
    assert false
  end

  test "purchase a negative ammount of a product" do
    assert false
  end

  test "purchase a product which does not exist" do
    assert false
  end

  test "select a specfic product which exists" do
    assert false
  end

  test "select a specfic product which does not exist" do
    assert false
  end

  test "select all products which have inventory" do
    assert false
  end
end
