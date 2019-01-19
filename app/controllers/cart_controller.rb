class CartController < ApplicationController
  def create
    @cart = Cart.new(name: params[:name], total: 0)
    @cart.save
    render json: {result: true};
  end

  def checkout
    tempCart = Product.find_by(name: params[:name])
    if tempCart.nil? == false
      # TODO: Calculate total cost return it and make changes to products
      render json: {cart: tempCart, result: true} and return;
    end
    render json: {result: false};
  end
end
