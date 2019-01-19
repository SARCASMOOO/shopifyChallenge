require 'test_helper'

class ProductControllerTest < ActionDispatch::IntegrationTest
  def setup
     @bannana = products(:bannana)
     @apple = products(:apple)
  end

  test "purchase a product" do
    post "/product", params: {name: @bannana.name, amount: 1}
    assert_equal true, json_response['result']
  end

  test "purchase when product with no inventory" do
    post "/product", params: {name: @apple.name, amount: 1}
    assert_equal false, json_response['result']
  end

  test "purchase too much of a product" do
    post "/product", params: {name: @bannana.name, amount: 30}
    assert_equal false, json_response['result']
  end

  test "purchase a negative ammount of a product" do
    post "/product", params: {name: @bannana.name, amount: -2}
    assert_equal false, json_response['result']
  end

  test "purchase a product which does not exist" do
    post "/product", params: {name: "Fake Product", amount: 1}
    assert_equal false, json_response['result']
  end

  test "select a specfic product which exists" do
    get "/product", params: {name: @bannana.name}
    assert_equal true, json_response['result']
  end

  test "select a specfic product which does not exist" do
    get "/product", params: {name: "Does not exist"}
    assert_equal true, json_response['result']
  end

  test "select all products which have inventory" do
    get "/products", params: {option: true}
    assert_equal true, json_response['result']
  end

  test "select all products" do
    get "/products", params: {option: false}
    assert_equal true, json_response['result']
  end
end
