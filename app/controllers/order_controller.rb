class OrderController < ApplicationController
  def addToOrder
    productName = params[:productName]
    cartName = params[:cartName]
    amount = params[:amount]

    tempCart = Cart.find_by(name: cartName)
    tempProduct = Product.find_by(name: productName)

    if tempProduct.nil? == false &&  tempCart.nil? == false
      if tempProduct.inventory > 0 && amount.nil? == false
        if amount.to_i > 0
          #check if order already exists
          @order = CartsProduct.find_by(product_id: tempProduct.id,
          cart_id: tempCart.id)

          if @order.nil? == false
            @order.update_attribute(:amount, @order.amount + amount)
          else
            @order = CartsProduct.new(amount: amount, product_id: tempProduct.id,
            cart_id: tempCart.id)
            @order.save
          end

          render json: {result: true} and return;
        end
      end
    end

    render json: {result: false};
  end
end
