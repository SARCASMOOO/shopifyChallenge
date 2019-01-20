#      ssstevenstapleton@gmail.com
#      Product Controller
#      Purpose: Validate product attributes

class OrderController < ApplicationController

  #Params: options productName, cartName, amount
  #Purpose: Return all products or products with inventory
  def addToOrder
    productName = params[:productName]
    cartName = params[:cartName]
    amount = params[:amount]

    tempCart = Cart.find_by(name: cartName)
    tempProduct = Product.find_by(name: productName)

    #check if order already exists
    render json: {result: false} and return if !isValidOrder(tempProduct, tempCart, amount)
    @order = CartsProduct.find_by(product_id: tempProduct.id,
    cart_id: tempCart.id)

    #Update order or create a new one if it doesn not exist
    if @order.nil? == false
      @order.update_attribute(:amount, @order.amount + amount)
    else
      @order = CartsProduct.new(amount: amount, product_id: tempProduct.id,
      cart_id: tempCart.id)
      @order.save
    end

    render json: {result: true} and return;
  end

  private
    #Params: tempProduct, tempCart, amount
    #Purpose: Check that order is valid
    def isValidOrder(tempProduct, tempCart, amount)
      if tempProduct.nil? == false &&  tempCart.nil? == false && amount.nil? == false
        return true if tempProduct.inventory > 0 && amount.to_i > 0
      end
      return false
    end
end
