class CartController < ApplicationController
  def create
    @cart = Cart.new(name: params[:name], total: 0)
    @cart.save
    render json: {result: true};
  end

  def checkout
    tempCart = Cart.find_by(name: params[:cartName])
    if tempCart.nil? == false
      total = 0
      orders = CartsProduct.where("cart_id == #{tempCart.id}")
      for order in orders
        tempProd = Product.find(order.product_id)

        if tempProd.inventory >= order.amount
          test = tempProd.inventory - order.amount
          tempProd.update(inventory: test)
          total += order.amount * tempProd.price
        end
      end

      render json: {cart: tempCart, result: true, total: total} and return;
    end

    render json: {result: false};
  end
end
