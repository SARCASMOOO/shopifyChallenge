#      ssstevenstapleton@gmail.com
#      Product Controller
#      Purpose: Validate product attributes

class ProductController < ApplicationController

  #Params: options
  #Purpose: Return all products or products with inventory
  def products
    if params[:option] == "true"
      products = Product.where("inventory > 0")
    else
      products = Product.all()
    end

    render json: {result: true, products: products};
  end

  #Params: name
  #Purpose: Return the corresponding product for given id
  def product
    tempProd = Product.find_by(name: params[:name])
    if tempProd.nil? == false
      render json: {product: tempProd, result: true} and return;
    end
    render json: {result: false};
  end

  #Params: name, amount
  #Purpose: Purchase a product
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

  #Params: name
  #Purpose: Create and save a new product
  def create
    @product = Product.new(name: params[:name])
    if @product.save
      render json: {result: true};
    else
      render json: {result: false};
    end
  end
end
