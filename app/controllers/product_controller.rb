class ProductController < ApplicationController

  def products
    if params[:option] == "true"
      products = Product.where("inventory > 0")
    else
      products = Product.all()
    end
    puts products.count
    render json: {result: true, products: products};
  end

  def product
    tempProd = Product.find_by(name: params[:name])
    if tempProd.nil? == false
      render json: {product: tempProd, result: true} and return;
    end
    render json: {result: false};
  end

  def purchase
    tempProd = Product.find_by(name: params[:name])

    if tempProd.nil? == false
     if tempProd.inventory >= params[:amount].to_i and params[:amount].to_i > 0
        quantity = tempProd.inventory - params[:amount].to_i
        tempProd.update(inventory: quantity)
        render json: {result: true} and return;
      end
    end

    render json: {result: false};
  end

  def create
    @product = Product.new(name: params[:name])
    @product.save
    render json: {result: true};
  end
end
